package com.personal.geocaching.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.personal.geocaching.models.Geocaching;
import com.personal.geocaching.models.LoginUser;
import com.personal.geocaching.models.User;
import com.personal.geocaching.services.GeocachingService;
import com.personal.geocaching.services.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService users;
	@Autowired
	private GeocachingService geocaches;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
    
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, 
			Model model, HttpSession session) {
		User user = users.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, 
			Model model, HttpSession session) {
		User user = users.login(newLogin, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		model.addAttribute("geocaches", geocaches.all());
		model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
		return "dashboard.jsp";
	}
	
	@GetMapping("/addGeocaching")
	public String addGeocaching(@ModelAttribute("geocaching") Geocaching geocaching, Model model, HttpSession session) {
		User user = users.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		
		return "new.jsp";
	}
	
	@PostMapping("/geocaches")
	public String createGeocaching(@Valid @ModelAttribute("geocaching") Geocaching geocaching, BindingResult result) {
		if (result.hasErrors()) {
			return "create.jsp";
		}
		geocaches.create(geocaching);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/geocaches/{id}/edit")
	public String editGeocaching(Model model, @PathVariable("id") Long id, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Geocaching geocaching = geocaches.findById(id);
		model.addAttribute("geocaching", geocaching);
		
		return "edit.jsp";
	}
	
	@GetMapping("/geocaches/{id}")
	public String showGeocaching(Model model, @PathVariable("id") Long id, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Geocaching geocaching = geocaches.findById(id);
    	model.addAttribute("geocaching", geocaching);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	
    	return "view.jsp";
	}
	
	@PutMapping("/geocaches/{id}")
	public String updateGeocaching(@Valid @ModelAttribute("geocaching") Geocaching geocaching, BindingResult result, 
			Model model) {
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		System.out.println("Geocaching to be saved in the DataBase: " + geocaching.getId());
		
		geocaches.update(geocaching);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
	
	@DeleteMapping("/geocaches/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		
		geocaches.delete(id);
		return "redirect:/dashboard";
	}
	
}