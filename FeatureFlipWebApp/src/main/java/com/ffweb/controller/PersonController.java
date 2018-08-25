package com.ffweb.controller;

import java.util.ArrayList;
import java.util.List;

import org.ff4j.FF4j;
import org.ff4j.spring.autowire.FF4JFeature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ffweb.form.PersonForm;
import com.ffweb.model.Person;

@Controller
@RequestScope
public class PersonController
{

    private static final Logger LOG = LoggerFactory.getLogger(PersonController.class);
    
    @FF4JFeature(value = "sasi-f1")
    private boolean feature_X;

    @Autowired
    private FF4j ff4j;
    
    private static List<Person> persons = new ArrayList<Person>();

    static
    {
        persons.add(new Person("Dennis", "Ritchie", "C-Lang"));
        persons.add(new Person("Sabeer", "Bhatia", "Hot Mail"));
        persons.add(new Person("Ken", "Thomson", "Bell Labs, Unix"));
        persons.add(new Person("Steve", "Jobs", "Apple, CEO"));
        persons.add(new Person("Vinod", "Koshla", "Sun Mircro Systems, CEO"));
        persons.add(new Person("Sundar", "Pichai", "Google, CEO"));
        persons.add(new Person("Sam", "Ramji", "Cloud Foundry, CEO"));
        persons.add(new Person("Vivek", "Ranadive", "TIBCO, Founder"));
    }

    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public String index(Model model)
    {

        // model.addAttribute("message", message);

        return "index";
    }
    
      
    @GetMapping("/login")
    public String login()
    {
        return "/login";
    }

    @RequestMapping(value = { "/personList" }, method = RequestMethod.GET)
    public String personList(Model model)
    {        
        if(feature_X)
        {
            LOG.info(" SASI-F1 ON");
        }
        else
        {
            LOG.info(" SASI-F1 OFF");
        }
        
        if(ff4j.check("sasi-f2"))
        {
            LOG.info(" SASI-F2 ON");
        }
        else
        {
            LOG.info(" SASI-F2 OFF");
        }
        model.addAttribute("persons", persons);        

        return "personList";
    }

    @RequestMapping(value = { "/addPerson" }, method = RequestMethod.GET)
    public String showAddPersonPage(Model model)
    {

        PersonForm personForm = new PersonForm();
        model.addAttribute("personForm", personForm);

        return "addPerson";
    }

    @RequestMapping(value = { "/addPerson" }, method = RequestMethod.POST)
    public String savePerson(Model model, @ModelAttribute("personForm") PersonForm personForm)
    {

        String firstName = personForm.getFirstName();
        String lastName = personForm.getLastName();
        String who = personForm.getWhoIs();

        if (firstName != null && firstName.length() > 0 //
                && lastName != null && lastName.length() > 0)
        {
            Person newPerson = new Person(firstName, lastName, who);
            persons.add(newPerson);

            return "redirect:/personList";
        }

        model.addAttribute("errorMessage", true);
        return "addPerson";
    }

    @RequestMapping(value = { "/removePerson/{index}" }, method = RequestMethod.GET)
    public String removePerson(Model model, @PathVariable int index)
    {        
            persons.remove(index);
            return "redirect:/personList";
      
    }
    
    @RequestMapping(value = { "/modifyPerson/{firstName}/{lastName}/{whoIs}" }, method = RequestMethod.POST)
    public String modifyPerson(Model model, @PathVariable String firstName, @PathVariable String lastName, @PathVariable String whoIs)
    {
       
        if (firstName != null && firstName.length() > 0 //
                && lastName != null && lastName.length() > 0)
        {
            Person newPerson = new Person(firstName, lastName, whoIs);
            persons.add(newPerson);

            return "redirect:/personList";
        }

        model.addAttribute("errorMessage", true);
        return "addPerson";
    }
    
    @RequestMapping(value = { "/addNumbers" }, method = RequestMethod.POST)
    public String addNumbers(RedirectAttributes redirectModel, @RequestParam("numOne") int numOne, @RequestParam("numTwo") int numTwo)
    {        
            int sum = numOne+numTwo;
            redirectModel.addFlashAttribute("sum",sum);
            return "redirect:/personList";
      
    }

}
