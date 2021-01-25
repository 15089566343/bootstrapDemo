package com.hsw.bootstrap.dao;

import com.hsw.bootstrap.entity.File;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.Reader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName BootstrapDao
 * @Description TODO
 * @Author huangshengwen
 * @Date 2021/1/15 11:23
 * @Version 1.0
 **/
@Repository("bootstrapDao")
public class BootstrapDao {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private NamedParameterJdbcTemplate getNamedParameterJdbcTemplate() {
        return new NamedParameterJdbcTemplate(this.jdbcTemplate);
    }

    public void saveFile(File file) {
        String insertSQL = "insert into t_uploadFile values(seq_t_uploadFile.nextval, :imgId, :imgName, :createTime, :singleId, :imgBase64)";
        logger.warn("saveFile:\n" + insertSQL + "\n参数: " + file);
        this.getNamedParameterJdbcTemplate().update(insertSQL, new BeanPropertySqlParameterSource(file));
    }

    public List<File> queryFile(String fileId) {
        Map<String, Object> paramMap = new HashMap<>();
        String sql = "select * from t_uploadFile t where t.singleId= :fileId";
        paramMap.put("fileId", fileId);
        return this.getNamedParameterJdbcTemplate().query(sql, paramMap, new RowMapper<File>() {
            @Override
            public File mapRow(ResultSet rs, int rowNum) throws SQLException {
                File file = new File();
                file.setImgId(rs.getString("imgId"));
                file.setImgName(rs.getString("imgName"));
                file.setSingleId(rs.getString("singleId"));
                file.setCreateTime(rs.getString("createTime"));
                file.setImgBase64(rs.getString("Base64"));
                Reader inputStream = rs.getClob("Base64").getCharacterStream();
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                int len = 0;
                try {
                    while ((len = inputStream.read()) != -1) {
                        out.write(len);
                    }
                    file.setImgBase64(new String(out.toByteArray()));
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (null != out) {
                            out.close();
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (inputStream != null) {
                                inputStream.close();
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
                return file;
            }
        });
    }
}
