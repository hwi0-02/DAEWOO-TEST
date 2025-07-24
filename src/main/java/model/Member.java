package model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Member {
    private String name;
    private String username;
    private String password;
    private String email;
}
