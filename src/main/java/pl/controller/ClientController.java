package pl.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.entity.Client;
import pl.repository.ClientRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/client")
public class ClientController {


    private final ClientRepository clientRepository;

    public ClientController(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    @GetMapping("/add-client")
    public String registration(Model model) {
        model.addAttribute("client", new Client());
        return "client";
    }

    @PostMapping("/add-client")
    public String registration(@ModelAttribute("client") @Valid Client client, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client";
        }
        clientRepository.save(client);
        return "redirect:/client/all";
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String showAllClient() {
        return "clientlist";
    }


    @ModelAttribute("allclients")
    public List<Client> allClients() {
        return clientRepository.findAll();
    }


    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateGet(@PathVariable int id, Model model) {
        model.addAttribute("client", clientRepository.findFirstById(id));
        return "client";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String updatePost(@ModelAttribute Client clientUpdate, @Valid Client client, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client";
        }
        clientRepository.save(client);
        return "redirect:http://localhost:8080/client/all";

    }
}
