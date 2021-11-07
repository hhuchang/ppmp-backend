package cc.c2appstore.controller;


import cc.c2appstore.model.entity.Document;

import cc.c2appstore.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/doc")
public class DocumentController {

    @Autowired
    private DocumentService documentService;


    @GetMapping("/project/{project_id}/parent/{parent_id}")
    public List<Document> listByProjectIdAndParentId(@PathVariable Long project_id,@PathVariable Long parent_id){

        List<Document> documents=documentService.listByProjectIdAndParentId(project_id,parent_id);
        return documents;

    }

    public 







}
