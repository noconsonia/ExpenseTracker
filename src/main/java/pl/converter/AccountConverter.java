package pl.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.entity.Account;
import pl.repository.AccountRepository;

public class AccountConverter implements Converter<String, Account> {

    @Autowired
    private AccountRepository accountRepository;

    @Override
    public Account convert(String s){
        return accountRepository.findFirstById(Integer.parseInt(s));
    }
}

