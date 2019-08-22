package pl.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.entity.Client;
import pl.repository.ClientRepository;

public class ClientConverter implements Converter<String, Client> {

    @Autowired
    private ClientRepository clientRepository;

    @Override
    public Client convert(String s) {
        return clientRepository.findFirstById(Integer.parseInt(s));
    }
}
