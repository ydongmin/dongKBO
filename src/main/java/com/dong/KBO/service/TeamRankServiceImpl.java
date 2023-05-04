package com.dong.KBO.service;

import com.dong.KBO.dao.TeamRankDao;
import com.dong.KBO.domain.TeamRankDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeamRankServiceImpl implements TeamRankService {
    @Autowired
    TeamRankDao teamRankDao;

    @Override
    public List<TeamRankDto> getList() throws Exception {
        return teamRankDao.selectAll();
    }

    @Override
    public TeamRankDto read(String team_name) throws Exception {
        TeamRankDto teamRankDto = teamRankDao.select(team_name);

        return teamRankDto;
    }
}
