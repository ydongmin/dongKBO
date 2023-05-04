package com.dong.KBO.service;

import com.dong.KBO.dao.H_recordDao;
import com.dong.KBO.domain.H_recordDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class H_recordServiceImpl implements H_recordService {
    @Autowired
    H_recordDao h_recordDao;

    @Override
    public List<H_recordDto> getList() throws Exception {
        return h_recordDao.selectAll();
    }

    @Override
    public H_recordDto read(Integer pitcher_rank) {
        H_recordDto h_recordDto = h_recordDao.select(pitcher_rank);

        return h_recordDto;
    }

    @Override
    public int remove(String player_name) throws Exception {
        return h_recordDao.delete(player_name);
    }

    @Override
    public int modify(H_recordDto h_recordDto) throws Exception {
        return h_recordDao.update(h_recordDto);
    }
}
