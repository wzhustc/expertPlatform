package cn.ustc.ep.util;

public class ResultObject<T>{

	private static final long serialVersionUID = 1L;
	private String success;   //是否成功
	private String error;   //错误
	private String msg;   //返回提示信息
	private T DataInfo;  //实体数据

	public String isSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getDataInfo() {
		return DataInfo;
	}

	public void setDataInfo(T dataInfo) {
		DataInfo = dataInfo;
	}

	@Override
	public String toString() {
		return "QueryResult [success=" + success + ", error=" + error
				+ ", msg=" + msg + ", DataInfo=" + DataInfo + "]";
	}

}
