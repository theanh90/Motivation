package com.theanh.first.dao;

import org.springframework.stereotype.Repository;

import com.theanh.first.model.InvoiceDetailsModel;

@Repository("invoiceDetailsDao")
public class InvoiceDetailsDaoImpl extends AbstractDao<Integer, InvoiceDetailsModel> implements InvoiceDetailsDao{

}
