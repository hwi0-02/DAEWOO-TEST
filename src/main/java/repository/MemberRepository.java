package repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.Member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class MemberRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void save(Member member) {
        String sql = "INSERT INTO member (name, username, password, email) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, member.getName(), member.getUsername(), member.getPassword(), member.getEmail());
    }

    public Member findByUsername(String username) {
        String sql = "SELECT * FROM member WHERE username = ?";
        List<Member> members = jdbcTemplate.query(sql, new MemberRowMapper(), username);
        return members.isEmpty() ? null : members.get(0);
    }

    private static class MemberRowMapper implements RowMapper<Member> {
        @Override
        public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
            Member member = new Member();
            member.setName(rs.getString("name"));
            member.setUsername(rs.getString("username"));
            member.setPassword(rs.getString("password"));
            member.setEmail(rs.getString("email"));
            return member;
        }
    }
}
