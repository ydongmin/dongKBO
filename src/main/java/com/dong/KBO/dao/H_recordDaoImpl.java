package com.dong.KBO.dao;

import com.dong.KBO.domain.H_recordDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class H_recordDaoImpl implements H_recordDao {
    @Autowired
    SqlSession session;

    private static String namespace = "com.dong.KBO.dao.H_recordMapper.";

    @Override
    public List<H_recordDto> selectAll() {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public H_recordDto select(Integer pitcher_rank) {
        return session.selectOne(namespace+"select", pitcher_rank);
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int delete(String player_name) throws Exception {
        return session.delete(namespace+"delete", player_name);
    }

    @Override
    public int insert(H_recordDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    }

    @Override
    public int update(H_recordDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    }
}
