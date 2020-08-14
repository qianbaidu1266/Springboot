package com.miaoshaproject.service.impl;

import com.miaoshaproject.dao.ItemDOMapper;
import com.miaoshaproject.dao.ItemStockDOMapper;
import com.miaoshaproject.dataobject.ItemDO;
import com.miaoshaproject.dataobject.ItemStockDO;
import com.miaoshaproject.error.BusinessException;
import com.miaoshaproject.error.EmBusinessError;
import com.miaoshaproject.service.ItemService;
import com.miaoshaproject.service.PromoService;
import com.miaoshaproject.service.model.ItemModel;
import com.miaoshaproject.service.model.PromoModel;
import com.miaoshaproject.validator.ValidationResult;
import com.miaoshaproject.validator.ValidatorImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;


@Service

public class ItemServiceImpl implements ItemService{

    @Autowired
    private ValidatorImpl validator;

    @Autowired
    private ItemDOMapper itemDOMapper;

    @Autowired
    private ItemStockDOMapper itemStockDOMapper;

    @Autowired
    private PromoService promoService;

    /**
     * @param itemModel
     * @return Item
     * @description 将itemModel转换为Item！！！！大转小！小是用来操作数据库的
     */
    private ItemDO convertItemDOFromItemModel(ItemModel itemModel){
        if(itemModel==null){
            return null;
        }
        ItemDO itemDO=new ItemDO();
        BeanUtils.copyProperties(itemModel,itemDO);
        //数据库中price是double类型的，ItemModel中是BigDecimal，因为要避免类型转化时出现精度丢失，前端不能用double
        itemDO.setPrice(itemModel.getPrice().doubleValue()); //这里是因为类型不一样所以需要手动设置！！！
        return itemDO;
    }

    /**
     * @param itemModel
     * @return ItemStock：商品库存
     * @description 将itemModel转化为ItemStock！大转小
     */
    private ItemStockDO convertItemStockDOFromItemModel(ItemModel itemModel){
        if(itemModel==null){
            return null;
        }
        ItemStockDO itemStockDO=new ItemStockDO();
        itemStockDO.setItemId(itemModel.getId());  //存入itemid
        itemStockDO.setStock(itemModel.getStock());  //也是set，和密码一样

        return itemStockDO;

    }


//    /**
//     * @param itemDO
//     * @param itemStockDO
//     * @return ItemModel
//     * @description 将item和itemStock转换为ItemModel！小转大！
//     */
//    private ItemModel convertFromEntity(ItemDO itemDO, ItemStockDO itemStockDO) {
//        if (itemDO == null) {
//            return null;
//        }
//        ItemModel itemModel = new ItemModel();
//        BeanUtils.copyProperties(itemDO, itemModel);
//
//        //从数据库data向item model转的时候也要注意price的类型问题!!!
//        itemModel.setPrice(new BigDecimal(itemDO.getPrice()));
//        itemModel.setStock(itemStockDO.getStock());
//
//        return itemModel;
//    }


    @Override
    @Transactional
    public ItemModel createItem(ItemModel itemModel) throws BusinessException {

        //校验入参
        ValidationResult result=validator.validate(itemModel);
                if(result.isHasErrors()){

                        throw new BusinessException(EmBusinessError.PARAMETER_VALIDATION_ERROR,result.getErrMsg());

                }

        //转化itemmodel->dataobject
        ItemDO itemDO=this.convertItemDOFromItemModel(itemModel);

        //写入数据库
        int id=itemDOMapper.insertSelective(itemDO);
        System.out.println("Id:"+id);       //此处id为成功插入数据库数据条数，成功插入为1

        itemModel.setId(itemDO.getId());   //用来绑的库存表的itemid，逻辑错误：itemDO中id默认为null，而不是主键自增(已解决)

        System.out.println("itemDO.id:"+itemDO.getId());  //null
        System.out.println("itemModel.id:"+itemModel.getId());  //null

        ItemStockDO itemStockDO=this.convertItemStockDOFromItemModel(itemModel);
        itemStockDOMapper.insertSelective(itemStockDO);

        //返回创建完成的对象
        return this.getItemById(itemModel.getId());


    }

    @Override
    public List<ItemModel> listItem() {
        List<ItemDO> itemDOList=itemDOMapper.listItem();
        List<ItemModel>itemModelList = itemDOList.stream().map(itemDO -> {
            ItemStockDO itemStockDO=itemStockDOMapper.selectByItemId(itemDO.getId());
            ItemModel itemModel =this.convertModelFromDataObject(itemDO,itemStockDO);
            return itemModel;
        }).collect(Collectors.toList());

        return itemModelList;
    }

    @Override
    public ItemModel getItemById(Integer id) {
        ItemDO itemDO=itemDOMapper.selectByPrimaryKey(id);
        if(itemDO==null){
        return null;
        }
        //操作获得库存数量
        ItemStockDO itemStockDO=itemStockDOMapper.selectByItemId(itemDO.getId());

        //将dataobject->model
        //这里是用item的id关联到的itemid来查，如果没关联上，就查不到
        ItemModel itemModel=convertModelFromDataObject(itemDO,itemStockDO);


        //获取活动商品信息
       PromoModel promoModel= promoService.getPromoByItemId(itemModel.getId());
       if(promoModel!=null&&promoModel.getStatus().intValue()!=3){

           itemModel.setPromoModel(promoModel);

       }

        return itemModel;
    }

    @Override
    @Transactional
    public boolean decreaseStock(Integer itemId, Integer amount) throws BusinessException {
        int affectedRow=itemStockDOMapper.decreaseStock(itemId,amount);
        if(affectedRow>0){
            //库存更新成功
            return true;
        }else {
            return false;
        }
    }

    @Override
    @Transactional
    public void increaseSales(Integer itemId, Integer amount) throws BusinessException {
            itemDOMapper.increaseSales(itemId,amount);
    }


    /**
          * @param itemDO
          * @param itemStockDO
          * @return ItemModel
          * @description 将item和itemStock转换为ItemModel！小转大！
          */
    private ItemModel convertModelFromDataObject(ItemDO itemDO,ItemStockDO itemStockDO){

        if(itemDO == null){
            return null;
        }
        if(itemStockDO == null){
            return null;
        }

        ItemModel itemModel =new ItemModel();
        BeanUtils.copyProperties(itemDO,itemModel);

        //从数据库data向item model转的时候也要注意price的类型问题!!!
      //  itemModel.setPrice(new BigDecimal(itemDO.getDescription()));
        itemModel.setPrice(new BigDecimal(itemDO.getPrice()));
        itemModel.setStock(itemStockDO.getStock());

        return itemModel;
    }

}


