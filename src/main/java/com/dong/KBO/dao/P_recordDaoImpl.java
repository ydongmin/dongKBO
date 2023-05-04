package com.dong.KBO.dao;

import com.dong.KBO.domain.H_recordDto;
import com.dong.KBO.domain.P_recordDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class P_recordDaoImpl implements P_recordDao {
    @Autowired
    SqlSession session;

    private static String namespace = "com.dong.KBO.dao.P_recordMapper.";

    @Override
    public List<P_recordDto> selectAll() {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public P_recordDto select(Integer pitcher_rank) {
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
    public int insert(P_recordDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    }

    @Override
    public int update(P_recordDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    }
}
