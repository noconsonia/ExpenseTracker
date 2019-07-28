package pl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.entity.Account;
import pl.entity.Cost;
import pl.entity.Mpk;
import pl.entity.Payment;
import pl.repository.AccountRepository;
import pl.repository.CostRepository;
import pl.repository.MpkRepository;
import pl.repository.PaymentRepository;

import java.util.List;

@Controller
@RequestMapping("/cost")
public class CostController {

    private final CostRepository costRepository;
    private final MpkRepository mpkRepository;
    private final AccountRepository accountRepository;
    private final PaymentRepository paymentRepository;

    public CostController(CostRepository costRepository, MpkRepository mpkRepository, AccountRepository accountRepository, PaymentRepository paymentRepository) {
        this.costRepository = costRepository;
        this.mpkRepository = mpkRepository;
        this.accountRepository = accountRepository;
        this.paymentRepository = paymentRepository;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addForm(Model model) {
        model.addAttribute("cost", new Cost());
        return "cost";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String processForm(@ModelAttribute @Validated Cost tweet, BindingResult result) {
        if (result.hasErrors()) {
            return "cost";
        }
        costRepository.save(tweet);
        return "redirect:list";
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
}
