package cn.ustc.ep.po;

import java.util.Date;

public class Honor {
    private Integer id;

    private Integer eId;

    private Date honordate;

    private String honor;

    private String honorurl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public Date getHonordate() {
        return honordate;
    }

    public void setHonordate(Date honordate) {
        this.honordate = honordate;
    }

    public String getHonor() {
        return honor;
    }

    public void setHonor(String honor) {
        this.honor = honor == null ? null : honor.trim();
    }

    public String getHonorurl() {
        return honorurl;
    }

    public void setHonorurl(String honorurl) {
        this.honorurl = honorurl == null ? null : honorurl.trim();
    }
}