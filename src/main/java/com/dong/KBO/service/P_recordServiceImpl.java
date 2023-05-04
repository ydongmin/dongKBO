package com.dong.KBO.service;

import com.dong.KBO.dao.P_recordDao;
import com.dong.KBO.domain.H_recordDto;
import com.dong.KBO.domain.P_recordDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class P_recordServiceImpl implements P_recordService {
    @Autowired
    P_recordDao p_recordDao;

    @Override
    public List<P_recordDto> getList() throws Exception {
        return p_recordDao.selectAll();
    }

    @Override
    public P_recordDto read(Integer pitcher_rank) {
        P_recordDto p_recordDto = p_recordDao.select(pitcher_rank);

        return p_recordDto;
    }

    @Override
    public int remove(String player_name) throws Exception {
        return p_recordDao.delete(player_name);
    }

    @Override
    public int modify(P_recordDto p_recordDto) throws Exception {
        return p_recordDao.update(p_recordDto);
    }

}
