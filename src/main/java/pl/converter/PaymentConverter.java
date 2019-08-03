package pl.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.entity.Payment;
import pl.repository.PaymentRepository;

public class PaymentConverter implements Converter<String, Payment> {

    @Autowired
    private PaymentRepository paymentRepository;

    @Override
    public Payment convert(String s) {
        return paymentRepository.findFirstById(Integer.parseInt(s));
    }
}