package com.spring.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.crud.dao.ContactDao;
import com.spring.crud.model.Contact;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MainController {

		@Autowired
		private ContactDao contactdao;
	
		@RequestMapping("/home")
		public String home(Model m) {
			List<Contact> contactList=contactdao.getAll();
			System.out.println("Contacts retrieved: " + contactList);
			
			m.addAttribute("contactList" ,contactList);
			
			return "home";
		}
		
		@RequestMapping("/add")
		public String Add(Model m) {
			
			m.addAttribute("title","AddContact");
			
			return "Add";
		}
		
		@RequestMapping("/delete/{id}")
		public RedirectView deleteHandle(@PathVariable("id")int id,HttpServletRequest r) {
			this.contactdao.delete(id);
			RedirectView rd=new RedirectView();
			rd.setUrl(r.getContextPath()+"/");
			
			
			return rd;
		}
		
		@RequestMapping("update/{id}")
		public String Update_form(@PathVariable("id") int id,Model m){
			
			Contact cnt = this.contactdao.getById(id);
			m.addAttribute("contact",cnt);
			
			return "update";
		}
	
		@RequestMapping(value = "/handle-contact", method = RequestMethod.POST)
		public RedirectView handleContact(@ModelAttribute Contact contact, HttpServletRequest request) {

		    if (contact.getId() != null && contact.getId() > 0) { 
		        contactdao.update(contact); // Update existing contact
		    } else {
		        contactdao.save(contact); // Save new contact
		    }

		    RedirectView rd = new RedirectView();
		    rd.setUrl(request.getContextPath() + "/");
		    return rd;
		}

		
}
