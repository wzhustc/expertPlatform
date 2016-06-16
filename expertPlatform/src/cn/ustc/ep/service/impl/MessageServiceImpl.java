package cn.ustc.ep.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ustc.ep.mapper.MessageMapper;
import cn.ustc.ep.po.Message;
import cn.ustc.ep.po.MessageExample;
import cn.ustc.ep.po.MessageExample.Criteria;
import cn.ustc.ep.service.MessageService;
import cn.ustc.ep.util.Parameter;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper ;
	
	@Override
	public List<Message> getUnReadMessageByUserID(Integer id) {
		
		MessageExample messageExample = new MessageExample() ;
		Criteria criteria = messageExample.createCriteria();
		criteria.andReceptEqualTo(id.toString()) ;
		criteria.andIsReadEqualTo(Parameter.UNREAD);
		
		List<Message> messageList = messageMapper.selectByExample(messageExample) ;
		return messageList;
	}

	@Override
	public List<Message> getIsReadMessageByUserID(Integer id) {
		MessageExample messageExample = new MessageExample() ;
		Criteria criteria = messageExample.createCriteria();
		criteria.andReceptEqualTo(id.toString()) ;
		criteria.andIsReadEqualTo(Parameter.ISREAD);
		
		List<Message> messageList = messageMapper.selectByExample(messageExample) ;
		return messageList;
	}

	@Override
	public String deleteMessageByIds(String[] ids) {
		MessageExample me = new MessageExample();
		List<Integer> idList = new ArrayList<Integer>();
		for (String i : ids) {
			idList.add(Integer.parseInt(i));
		}
		
		me.createCriteria().andIdIn(idList);
		messageMapper.deleteByExample(me);
		return Parameter.SUCCESS;
	}

	@Override
	public String updateMessageReadByIds(String[] ids) {
		
		Message m = new Message();
		m.setIsRead(1);
		List<Integer> idList = new ArrayList<Integer>();
		for (String i : ids) {
			idList.add(Integer.parseInt(i));
		}
		MessageExample me = new MessageExample();
		me.createCriteria().andIdIn(idList);
		int result = messageMapper.updateByExampleSelective(m, me);
		
		String ReturnResult = Parameter.FAIL;
		if(result>=1){
			ReturnResult = Parameter.SUCCESS;
		}
		return ReturnResult;
	}

	@Override
	public int selectCountByReceptAndIsRead(Integer id, int unread) {
		
		MessageExample me = new MessageExample();
		Criteria criteria = me.createCriteria();
		criteria.andReceptEqualTo(id.toString());
		criteria.andIsReadEqualTo(unread);
		int messageCome = messageMapper.countByExample(me);
		
		return messageCome;
	}

	@Override
	public String messageCompanyToExpert(Message messageObj) {
		int row = messageMapper.insertSelective(messageObj);
		
		String result=Parameter.FAIL;
		if(row>=1){
			result = Parameter.SUCCESS;
		}
		return result;
	}

}
