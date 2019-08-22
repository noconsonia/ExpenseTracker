package pl.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.entity.Mpk;
import pl.repository.MpkRepository;

public class MpkConverter implements Converter<String, Mpk> {

    @Autowired
    private MpkRepository mpkRepository;

    @Override
    public Mpk convert(String s) {
        return mpkRepository.findFirstById(Integer.parseInt(s));
    }
}

