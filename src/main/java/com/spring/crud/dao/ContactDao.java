package com.spring.crud.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.spring.crud.model.Contact;

@Component
public class ContactDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//save
	public int save(Contact contact) {
        String sql = "INSERT INTO contact (name, email, phone) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, contact.getName(), contact.getEmail(), contact.getPhone());
    }

    // Update an existing contact
    public int update(Contact contact) {
        String sql = "UPDATE contact SET name=?, email=?, phone=? WHERE id=?";
        return jdbcTemplate.update(sql, contact.getName(), contact.getEmail(), contact.getPhone(), contact.getId());
    }

    // Delete a contact
    public int delete(int id) {
        String sql = "DELETE FROM contact WHERE id=?";
        return jdbcTemplate.update(sql, id);
    }

    public Contact getById(int id) {
        String sql = "SELECT * FROM contact WHERE id=?";
        List<Contact> contacts = jdbcTemplate.query(sql, new ContactRowMapper(), id);
        return contacts.isEmpty() ? null : contacts.get(0);
    }

    // Fetch all contacts
    public List<Contact> getAll() {
        String sql = "SELECT * FROM contact";
        return jdbcTemplate.query(sql, new ContactRowMapper());
    }

    // RowMapper to map ResultSet to Contact object
    private static class ContactRowMapper implements RowMapper<Contact> {
        @Override
        public Contact mapRow(ResultSet rs, int rowNum) throws SQLException {
            Contact contact = new Contact();
            contact.setId(rs.getInt("id"));
            contact.setName(rs.getString("name"));
            contact.setEmail(rs.getString("email"));
            contact.setPhone(rs.getString("phone"));
            return contact;
        }
    }
}
