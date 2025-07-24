package controller;

import model.User;
import repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ExternalDataController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/externalData")
    public String showExternalDataPage() {
        return "externalData";
    }

    @GetMapping("/api/external-data")
    @ResponseBody
    public List<User> getExternalData() {
        return userRepository.findAll();
    }
}
