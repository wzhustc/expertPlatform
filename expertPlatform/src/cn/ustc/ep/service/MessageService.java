package cn.ustc.ep.service;

import java.util.List;

import cn.ustc.ep.po.Message;

/**
 * 
 * @author chengshuo
 *
 */
public interface MessageService {

	List<Message> getUnReadMessageByUserID(Integer id);

	List<Message> getIsReadMessageByUserID(Integer id);

	String deleteMessageByIds(String[] ids);

	String updateMessageReadByIds(String[] ids);

	int selectCountByReceptAndIsRead(Integer id, int unread);

	String messageCompanyToExpert(Message messageObj);
	
}
