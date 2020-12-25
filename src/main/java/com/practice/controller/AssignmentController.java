package com.practice.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author AnilShetty
 *
 */
@RestController
public class AssignmentController {
	@GetMapping(path = "/assignment")
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}

	@PostMapping(path = "/loadNames")
	public List<String> loadNames(@RequestBody String name) {
		return getNames(name);
	}

	public List<String> getNames(String name) {
		List<String> list = Arrays.asList("Anil", "Akshatha", "Raman", "Govinda", "Vitala", "John", "Pavan", "Arnold",
				"Vishal", "Anitha");
		List<String> s = list.stream().filter(n -> n.toUpperCase().startsWith(name.toUpperCase()))
				.collect(Collectors.toList());
		return s;
	}

}
