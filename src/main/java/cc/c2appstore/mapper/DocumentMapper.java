package cc.c2appstore.mapper;

import cc.c2appstore.model.entity.Document;
import cc.c2appstore.model.vo.DocTreeVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author changcan
 * @date 2021/11/05 14:14
 */
@Mapper
public interface DocumentMapper extends BaseMapper<Document> {



    List<Document> listByProjectIdAndParentId(Long project_id, Long parent_id);


}
