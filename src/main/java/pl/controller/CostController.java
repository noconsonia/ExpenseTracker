package pl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.entity.*;
import pl.repository.*;

import javax.validation.Valid;
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
    public String processForm(@ModelAttribute @Valid Cost cost, BindingResult result) {
        if (result.hasErrors()) {
            return "cost";
        }
        costRepository.save(cost);
        return "redirect:all";
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable int id) {
        costRepository.deleteById(id);
        return "redirect:https://app-expensetracker.herokuapp.com/cost/all";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateGet(@PathVariable int id, Model model) {
        model.addAttribute("cost", costRepository.findFirstById(id));
        return "cost";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String updatePost(@ModelAttribute Cost costUpdate, @Valid Cost cost, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "cost";
        }
        costRepository.save(cost);
        return "redirect:https://app-expensetracker.herokuapp.com/cost/all";
    }


    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String showAllCost() {
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

    @ModelAttribute("allcosts")
    public List<Cost> allCost() {
        return costRepository.findAll();
    }

    @RequestMapping(value = "/report-department", method = RequestMethod.GET)
    public String reportbyDepartment() {
        return "reportDepartment";
    }

    @RequestMapping(value = "/report-client", method = RequestMethod.GET)
    public String reportbyClient() {
        return "reportClient";
    }

    @RequestMapping(value = "/report-mpk", method = RequestMethod.GET)
    public String reportbyMpk() {
        return "reportMpk";
    }

    @ModelAttribute("allcostsbyDepartment")
    public List<Object[]> allCostbyDepartment() {
        List<Object[]> resultList = costRepository.getGroupByDepartment();
        return resultList;
    }

    @ModelAttribute("allcostsbyClient")
    public List<Object[]> allCostbyClient() {
        List<Object[]> resultList = costRepository.getGroupByClient();
        return resultList;
    }

    @ModelAttribute("allcostsbyMpk")
    public List<Object[]> allCostbyMpk() {
        List<Object[]> resultList = costRepository.getGroupByMpk();
        return resultList;
    }
}