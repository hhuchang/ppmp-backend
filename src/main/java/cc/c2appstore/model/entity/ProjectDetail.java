package cc.c2appstore.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * @author: changcan
 * @date: 2021/10/23 0:26
 *
 *
 *
 *     "screenCode":"CC500PV7D",
 *     "screenBrand":{label:"PANDA",value:5368},
 *     "ocGrade":"A+",
 *     "tcon":"TC.P500UHDPV7D.2",
 *     "tconBrand":"待定",
 *     "backlight":"3*7 200nits",//从dict根据id拿到的背光 name
 *     "diffuserPlate":"1复合1扩散",//从dict根据id拿到的膜片的name
 *     "shell":"康威kw50kw01-a",
 *     "shellBrand":"康威",
 *     "base":"塑料 双脚 黑色亚光 仿金属拉丝 处理",
 *     "boardCode":"BC-725",
 *     "specification":
 *       {fileName:'CV-TP.MS368B.PC821 C19217-SPECI-V2.pdf',
 *       fileId:921234,
 *       url:'http://ip:port/相对路径.suffix',
 *     ,  }
 *     "storage":"8G/64G",
 *     "port":"1 AV 3 HDMI2.1 1VGA",
 *     "OSVersion":"vvida",
 *     "operator":"芒果TV",
 *     "PQVersion":"t960_1.4-20210922",
 *     "appstore":"熊猫云",
 *     "preInstall":"芒果TV，熊猫云，蓝牙",
 *     "AndroidVersion":"9",
 *     "Launcher":"1.2",
 *     "boot":"3.6"
 *
 *
 * */



@Data
public class ProjectDetail implements Serializable {
    private static final long serialVersionUID = -6817600505497167123L;

    @TableId(value = "id",type = IdType.AUTO)
    private Long id;

    private Long projectId;



}

