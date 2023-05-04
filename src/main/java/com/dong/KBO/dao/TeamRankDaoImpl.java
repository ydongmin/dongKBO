package com.dong.KBO.dao;

import com.dong.KBO.domain.TeamRankDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeamRankDaoImpl implements TeamRankDao {
    @Autowired
    private SqlSession session;
    private static String namespace="com.dong.KBO.dao.TeamRankMapper.";

    @Override
    public List<TeamRankDto> selectAll() throws Exception{
        return session.selectList(namespace + "selectAll");

    }

    @Override
    public TeamRankDto select(String team_name) throws Exception {
        return session.selectOne(namespace + "select", team_name);
    }
    @Override
    public int update(TeamRankDto teamRankDto) throws Exception {
        return session.update(namespace+"update", teamRankDto);
    }
//    @Override
//    public int count() throws Exception{ return 1;}
//    @Override
//    public void deleteAll() throws Exception{}

}
