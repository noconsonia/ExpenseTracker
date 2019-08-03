package pl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.entity.*;
import pl.repository.*;

import java.util.List;

@Controller
@RequestMapping("/cost")
public class CostController {
    private final CostRepository costRepository;
    private final MpkRepository mpkRepository;
    private final AccountRepository accountRepository;
    private final PaymentRepository paymentRepository;
    private final ClientRepository clientRepository;
    private final DepartmentRepository departmentRepository;

    public CostController(CostRepository costRepository,
                          MpkRepository mpkRepository,
                          AccountRepository accountRepository,
                          PaymentRepository paymentRepository,
                          ClientRepository clientRepository,
                          DepartmentRepository departmentRepository) {
        this.costRepository = costRepository;
        this.mpkRepository = mpkRepository;
        this.accountRepository = accountRepository;
        this.paymentRepository = paymentRepository;
        this.clientRepository = clientRepository;
        this.departmentRepository = departmentRepository;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addForm(Model model) {
        model.addAttribute("cost", new Cost());
        return "cost";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String processForm(@ModelAttribute @Validated Cost cost, BindingResult result) {
        if (result.hasErrors()) {
            return "cost";
        }
        costRepository.save(cost);
        return "redirect:all";
    }


    @GetMapping("/all")
    public String all(Model model) {
        List<Cost> costs = costRepository.findAll();
        model.addAttribute("costs", costs);
        return "costlist";
    }




    @ModelAttribute("mpk")
    public List<Mpk> allMpk() {
        return mpkRepository.findAll();
    }

    @ModelAttribute("account")
    public List<Account> allAccount() {
        return accountRepository.findAll();
    }


    @ModelAttribute("payment")
    public List<Payment> allPayment() {
        return paymentRepository.findAll();
    }

    @ModelAttribute("client")
    public List<Client> allClient() {
        return clientRepository.findAll();
    }

    @ModelAttribute("department")
    public List<Department> allDepartment() {
        return departmentRepository.findAll();
    }

}
