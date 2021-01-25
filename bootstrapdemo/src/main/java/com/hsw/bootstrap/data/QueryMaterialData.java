package com.hsw.bootstrap.data;

import org.springframework.stereotype.Service;

/**
 * @ClassName QueryMaterialData
 * @Description TODO
 * @Author huangshengwen
 * @Date 2021/1/13 16:32
 * @Version 1.0
 **/
@Service
public class QueryMaterialData {

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    private String data = "[\n" +
            "  {\n" +
            "    \"material_type\": \"1\",\n" +
            "    \"is_need\": \"1\",\n" +
            "    \"base_guid\": \"P0001\",\n" +
            "    \"material_name\": \"材料1\"\n" +
            "  },\n" +
            "  {\n" +
            "    \"material_type\": \"1\",\n" +
            "    \"is_need\": \"1\",\n" +
            "    \"base_guid\": \"P0002\",\n" +
            "    \"material_name\": \"材料2\"\n" +
            "  },\n" +
            "  {\n" +
            "    \"material_type\": \"1\",\n" +
            "    \"is_need\": \"1\",\n" +
            "    \"base_guid\": \"P0003\",\n" +
            "    \"material_name\": \"材料3\"\n" +
            "  },\n" +
            "  {\n" +
            "    \"material_type\": \"1\",\n" +
            "    \"is_need\": \"1\",\n" +
            "    \"base_guid\": \"P0004\",\n" +
            "    \"material_name\": \"材料4\"\n" +
            "  },\n" +
            "  {\n" +
            "    \"material_type\": \"1\",\n" +
            "    \"is_need\": \"1\",\n" +
            "    \"base_guid\": \"P0005\",\n" +
            "    \"material_name\": \"材料5\"\n" +
            "  },\n" +
            "  {\n" +
            "    \"material_type\": \"1\",\n" +
            "    \"is_need\": \"0\",\n" +
            "    \"base_guid\": \"P0006\",\n" +
            "    \"material_name\": \"材料6\"\n" +
            "  }\n" +
            "]";
}
