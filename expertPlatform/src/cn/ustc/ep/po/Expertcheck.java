package cn.ustc.ep.po;

public class Expertcheck {
    private Integer id;

    private Integer eId;

    private Integer aId;

    private String checkdate;

    private String uncheckreasion;

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