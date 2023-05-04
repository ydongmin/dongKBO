package com.dong.KBO.service;

import com.dong.KBO.domain.H_recordDto;

import java.util.List;

public interface H_recordService {
    List<H_recordDto> getList() throws Exception;

    H_recordDto read(Integer pitcher_rank);

    int remove(String player_name) throws Exception;

    int modify(H_recordDto dto) throws Exception;
}
