package com.dong.KBO.domain;

import com.dong.KBO.dao.CommentDao;

import java.util.List;

public class CommentPageDto {
    private List<CommentDto> list;
    private PageHandler pageHandler;

    public List<CommentDto> getList() {
        return list;
    }

    public void setList(List<CommentDto> list) {
        this.list = list;
    }

    public PageHandler getPageHandler() {
        return pageHandler;
    }

    public void setPageHandler(PageHandler pageHandler) {
        this.pageHandler = pageHandler;
    }

    @Override
    public String toString() {
        return "CommentPageDto{" +
                "list=" + list +
                ", pageHandler=" + pageHandler +
                '}';
    }
}
