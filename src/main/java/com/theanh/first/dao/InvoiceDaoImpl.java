package com.theanh.first.dao;

import org.springframework.stereotype.Repository;

import com.theanh.first.model.InvoiceModel;

@Repository("invoiceDao")
public class InvoiceDaoImpl extends AbstractDao<Integer, InvoiceModel> implements InvoiceDao{

}
