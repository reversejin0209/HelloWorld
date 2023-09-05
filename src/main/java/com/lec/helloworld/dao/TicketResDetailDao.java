package com.lec.helloworld.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.helloworld.vo.TicketRes;
import com.lec.helloworld.vo.TicketResDetail;

@Mapper
public interface TicketResDetailDao {

	// 주문 상세 목록 추가
	public int addTOrderDetail(TicketResDetail ticketResDetail);

	// 주문 내역 조회
	public List<TicketRes> getTOrderDetail(long trcode);

	// 관리자: 티켓 상품 정보 전체 출력
	public List<TicketResDetail> tOrderDetailList(TicketResDetail ticketResDetail);

	// 관리자: 상품 정보 전체 글 갯수
	public int tOrderDeatailTotCnt();

	// 관리자: 입장 시 사용 티켓으로 변경
	public void usedTicket(int trdcode);

	// 사용티켓으로 변경 후 방문횟수 +1
	public void visitUp(String mid);
}
