package com.ffweb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ffweb.form.PersonForm;
import com.ffweb.model.Person;

@Controller
public class PersonController
{

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

    @RequestMapping(value = { "/personList" }, method = RequestMethod.GET)
    public String personList(Model model)
    {

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
    public String savePerson(Model model, //
            @ModelAttribute("personForm") PersonForm personForm)
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

}
