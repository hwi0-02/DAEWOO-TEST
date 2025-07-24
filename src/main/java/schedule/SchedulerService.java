package schedule;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.User;
import repository.UserRepository;

@Component
public class SchedulerService {

    private static final String API_URL = "https://jsonplaceholder.typicode.com/users";

    @Autowired
    private UserRepository userRepository;

    @Transactional
    @Scheduled(fixedRate = 60000)
    public void syncExternalUsers() {
        System.out.println("스케줄러 실행: 외부 사용자 데이터 동기화 중...");
        RestTemplate restTemplate = new RestTemplate();
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            String jsonResponse = restTemplate.getForObject(API_URL, String.class);
            List<User> users = objectMapper.readValue(jsonResponse, new TypeReference<List<User>>() {});

            userRepository.deleteAll();
            for (User user : users) {
                userRepository.save(user);
            }
            System.out.println("외부 사용자 데이터 동기화 완료: " + users.size() + "명 저장됨");
        } catch (Exception e) {
            System.err.println("외부 사용자 데이터 동기화 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
