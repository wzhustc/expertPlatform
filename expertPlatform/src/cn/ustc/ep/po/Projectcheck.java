package cn.ustc.ep.po;

public class Projectcheck {
    private Integer id;

    private Integer pId;

    private Integer aId;

    private String checkdate;

    private String uncheckreasion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public String getCheckdate() {
        return checkdate;
    }

    public void setCheckdate(String checkdate) {
        this.checkdate = checkdate == null ? null : checkdate.trim();
    }

    public String getUncheckreasion() {
        return uncheckreasion;
    }

    public void setUncheckreasion(String uncheckreasion) {
        this.uncheckreasion = uncheckreasion == null ? null : uncheckreasion.trim();
    }
}