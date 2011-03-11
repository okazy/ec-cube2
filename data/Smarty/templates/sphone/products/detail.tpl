<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2010 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/products.js"></script>
<script type="text/javascript">//<![CDATA[
// 規格2に選択肢を割り当てる。
function fnSetClassCategories(form, classcat_id2_selected) {
    var $form = $(form);
    var product_id = $form.find('input[name=product_id]').val();
    var $sele1 = $form.find('select[name=classcategory_id1]');
    var $sele2 = $form.find('select[name=classcategory_id2]');
    setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
}
//]]>
</script>

<!--▼CONTENTS-->
<div id="undercolumn" class="product product_detail">

    <!--★タイトル★-->
    <h2 class="title"><!--{$tpl_subtitle|h}--></h2>

    <div id="detailarea">
        <div id="detailphotoblock">

            <!--{assign var=key value="main_image"}-->

            <!--★画像★-->
            <a
                <!--{if $arrProduct.main_large_image|strlen >= 1}-->
                    href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_large_image|h}-->"
                    class="expansion"
                    onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_expansion_on.gif','expansion01');"
                    onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_expansion.gif','expansion01');"
                    target="_blank"
                <!--{/if}-->
            >
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_large_image|h}-->" width="<!--{$arrFile[$key].width}-->" height="<!--{$arrFile[$key].height}-->" alt="<!--{$arrProduct.name|h}-->" class="picture" /><br />
                <!--★拡大する★-->
                <!--{if $arrProduct.main_large_image|strlen >= 1}-->
                    <img src="<!--{$TPL_URLPATH}-->img/button/btn_expansion.gif" width="85" height="13" alt="画像を拡大する" name="expansion01" id="expansion01" />
                <!--{/if}-->
            </a>
        </div>

        <div id="detailrightblock">
            <!--▼商品ステータス-->
            <!--{assign var=ps value=$productStatus[$smarty.get.product_id]}-->
            <!--{if count($ps) > 0}-->
                <ul class="status_icon">
                    <li>
                    <!--{foreach from=$ps item=status}-->
                        <img src="<!--{$TPL_URLPATH}--><!--{$arrSTATUS_IMAGE[$status]}-->" width="65" height="17" alt="<!--{$arrSTATUS[$status]}-->" id="icon<!--{$status}-->" />
                    <!--{/foreach}-->
                    </li>
                </ul>
            <!--{/if}-->
            <!--▲商品ステータス-->

            <!--★ダウンロード販売★-->
            <!--{if $arrProduct.down == 2}-->
                <div><font color="red">本商品はダウンロード販売となります。<br /> 購入後はMYページの購入履歴からダウンロード可能です。</font></div><br />
            <!--{/if}-->

            <table>
                <tr>
                    <th colspan="2">
                        <!--★商品名★-->
                        <h2 class="product_name"><!--{$arrProduct.name|h}--></h2>
                    </th>
                </tr>
                 <tr>
                    <th>
                        <div class="product_code">商品コード</div>
                    </th>
                     <td class="product_td">
                     <span id="product_code_default">
                    <!--{if $arrProduct.product_code_min == $arrProduct.product_code_max}-->
                        <!--{$arrProduct.product_code_min|h}-->
                    <!--{else}-->
                        <!--{$arrProduct.product_code_min|h}-->～<!--{$arrProduct.product_code_max|h}-->
                    <!--{/if}-->
                </span><span id="product_code_dynamic"></span>
                     </td>
                </tr>
                <tr>
                    <th>
                        <!--★販売価格★-->
                        <div class="sale_price"><!--{$smarty.const.SALE_PRICE_TITLE}-->(税込)</div>
                    </th>
                    <td class="product_td">
                        <span class="price">
                            <span id="price02_default">
                                <!--{if $arrProduct.price02_min == $arrProduct.price02_max}-->
                                    <!--{$arrProduct.price02_min|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->
                                <!--{else}-->
                                    <!--{$arrProduct.price02_min|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->～<!--{$arrProduct.price02_max|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->
                                <!--{/if}-->
                            </span><span id="price02_dynamic"></span>
                            円
                        </span>
                    </td>
                </tr>
                <!--★通常価格★-->
                <!--{if $arrProduct.price01_max > 0}-->
                <tr>
                    <th>
                        <div class="normal_price">
                            <!--{$smarty.const.NORMAL_PRICE_TITLE}-->(税込)
                        </div>
                    </th>
                    <td class="product_td">
                        <span class="price">
                            <span id="price01_default">
                                <!--{if $arrProduct.price01_min == $arrProduct.price01_max}-->
                                    <!--{$arrProduct.price01_min|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->
                                <!--{else}-->
                                    <!--{$arrProduct.price01_min|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->～<!--{$arrProduct.price01_max|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->
                                <!--{/if}-->
                            </span><span id="price01_dynamic"></span>
                            円
                        </span>
                    </td>
                </tr>    
                <!--{/if}-->


                <!--★ポイント★-->
                <!--{if $smarty.const.USE_POINT !== false}-->
                <tr>
                    <th>
                        <div class="sale_price">ポイント</div>
                    </th>
                    <td class="product_td">
                        <span id="point_default">
                            <!--{if $arrProduct.price02_min == $arrProduct.price02_max}-->
                                <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id|number_format}-->
                            <!--{else}-->
                                <!--{if $arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id == $arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                                    <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id|number_format}-->
                                <!--{else}-->
                                    <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id|number_format}-->～<!--{$arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id|number_format}-->
                                <!--{/if}-->
                            <!--{/if}-->
                            </span><span id="point_dynamic">
                            Pt
                        </span>
                    </td>
                </tr>
                <!--{/if}-->

                <!--▼メーカーURL-->
                <!--{if $arrProduct.comment1|strlen >= 1}-->
                <tr>
                    <th>
                        <span class="comment1">メーカーURL
                    </th>
                    <td class="product_td">
                            <a href="<!--{$arrProduct.comment1|h}-->">
                                <!--{$arrProduct.comment1|h}--></a>
                    </td>
                </tr>
                <!--{/if}-->
                <!--▲メーカーURL-->

                <!--★関連カテゴリ★-->
                <tr>
                    <th>
                        <div class="relative_cat">関連カテゴリ</div>
                    </th>
                    <td class="product_td">
                        <!--{section name=r loop=$arrRelativeCat}-->
                        <p class="no_margin">
                            <!--{section name=s loop=$arrRelativeCat[r]}-->
                            <a href="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php?category_id=<!--{$arrRelativeCat[r][s].category_id}-->"><!--{$arrRelativeCat[r][s].category_name}--></a>
                            <!--{if !$smarty.section.s.last}--><!--{$smarty.const.SEPA_CATNAVI}--><!--{/if}-->
                            <!--{/section}-->
                        </p>
                        <!--{/section}-->
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="product_td">
                            <!--★詳細メインコメント★-->
                            <div class="main_comment"><!--{$arrProduct.main_comment|nl2br_html}--></div>
                    </td>
                </tr>
            </table>

            <!--▼買い物かご-->
            <form name="form1" id="form1" method="post" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="mode" value="cart" />
                <input type="hidden" name="product_id" value="<!--{$tpl_product_id}-->" />
                <input type="hidden" name="product_class_id" value="<!--{$tpl_product_class_id}-->" id="product_class_id" />
                <input type="hidden" name="favorite_product_id" value="" />


                <!--{if $tpl_stock_find}-->
                    <dl>
                        <!--{if $tpl_classcat_find1}-->
                            <!--▼規格1-->
                            <dt><!--{$tpl_class_name1|h}--></dt>
                            <dd>
                                <select name="classcategory_id1"
                                    style="<!--{$arrErr.classcategory_id1|sfGetErrorColor}-->"
                                    onchange="fnSetClassCategories(this.form);"
                                >
                                    <!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1.value}-->
                                </select>
                                <!--{if $arrErr.classcategory_id1 != ""}-->
                                    <br /><span class="attention">※ <!--{$tpl_class_name1}-->を入力して下さい。</span>
                                <!--{/if}-->
                            </dd>
                            <!--▲規格1-->
                        <!--{/if}-->

                        <!--{if $tpl_classcat_find2}-->
                            <!--▼規格2-->
                            <dt><!--{$tpl_class_name2|h}--></dt>
                            <dd>
                                <select name="classcategory_id2"
                                    style="<!--{$arrErr.classcategory_id2|sfGetErrorColor}-->"
                                    onchange="fnCheckStock(this.form);"
                                >
                                </select>
                                <!--{if $arrErr.classcategory_id2 != ""}-->
                                    <br /><span class="attention">※ <!--{$tpl_class_name2}-->を入力して下さい。</span>
                                <!--{/if}-->
                            </dd>
                            <!--▲規格2-->
                        <!--{/if}-->

                        <dt>数量</dt>
                        <dd>
                            <input type="text" name="quantity" class="box54" value="<!--{$arrForm.quantity.value|default:1|h}-->" maxlength="<!--{$smarty.const.INT_LEN}-->" style="<!--{$arrErr.quantity|sfGetErrorColor}-->" />
                            <!--{if $arrErr.quantity != ""}-->
                                <br /><span class="attention"><!--{$arrErr.quantity}--></span>
                            <!--{/if}-->
                        </dd>
                    </dl>
                <!--{/if}-->

                <div class="btn">
                    <!--{if $smarty.const.OPTION_FAVOFITE_PRODUCT == 1 && $tpl_login === true}-->

                    <!--{/if}-->

                    <!--{if $tpl_stock_find}-->
                        <div id="cartbtn_default">
                            <!--★カゴに入れる★-->
                            <div>
                               <a href="javascript:void(document.form1.submit())" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/products/b_cartin_on.gif','cart');" onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/products/b_cartin.gif','cart');" class="spbtn spbtn-agree">
                                    カゴに入れる
                                </a>
                            </div>
                            <!--{if 'sfGMODetailDisplay'|function_exists}--><!--{* GMOワンクリック *}-->
                                <!--{'sfGMODetailDisplay'|call_user_func}-->
                            <!--{/if}-->
                        </div>
                        <div class="attention" id="cartbtn_dynamic"></div>
                    <!--{else}-->
                        <div class="attention">申し訳ございませんが、只今品切れ中です。</div>
                    <!--{/if}-->
                </div>

                <!--{if $smarty.const.OPTION_FAVOFITE_PRODUCT == 1 && $tpl_login === true}-->
                        <div class="btn" id="btn-recommend">
                            <!--{assign var=add_favorite value="add_favorite`$add_favorite_product_id`"}-->
                            <!--{if $arrErr[$add_favorite]}--><div class="attention"><!--{$arrErr[$add_favorite]}--></div><!--{/if}-->
                            <!--{if !$arrProduct.favorite_count}-->
                               <a class="spbtn spbtn-medeum" href="javascript:fnModeSubmit('add_favorite','favorite_product_id','<!--{$arrProduct.product_id|h}-->');" class="spbtn spbtn-small">
                                    お気に入りに追加</a>
                            <!--{else}-->
                                <div>お気に入り登録済</div>
                            <!--{/if}-->
                        </div>
                   <!--{/if}-->
            </form>
            <!--▲買い物かご-->

        </div>
    </div>
    <!--詳細ここまで-->

    <!--▼サブコメント-->
    <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
        <!--{assign var=key value="sub_title`$smarty.section.cnt.index+1`"}-->
        <!--{if $arrProduct[$key] != ""}-->
            <div class="subarea">
                <h3><!--★サブタイトル★--><!--{$arrProduct[$key]|h}--></h3>
                <!--{assign var=ckey value="sub_comment`$smarty.section.cnt.index+1`"}-->

                <div class="subtext"><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br_html}--></div>

                <!--▼サブ画像-->
                <!--{assign var=key value="sub_image`$smarty.section.cnt.index+1`"}-->
                <!--{assign var=lkey value="sub_large_image`$smarty.section.cnt.index+1`"}-->
                <!--{if $arrProduct[$key]|strlen >= 1}-->
                    <div class="subphotoimg">
                        <a
                            <!--{if $arrProduct[$lkey]|strlen >= 1}-->
                                href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$lkey]|h}-->"
                                class="expansion"
                                onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_expansion_on.gif', 'expansion_<!--{$lkey|h}-->');"
                                onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_expansion.gif', 'expansion_<!--{$lkey|h}-->');"
                                target="_blank"
                            <!--{/if}-->
                        >
                            <img src="<!--{$arrFile[$key].filepath}-->" alt="<!--{$arrProduct.name|h}-->" width="<!--{$arrFile[$key].width}-->" height="<!--{$arrFile[$key].height}-->" /><br />
                            <!--{if $arrProduct[$lkey]|strlen >= 1}-->
                                <img src="<!--{$TPL_URLPATH}-->img/button/btn_expansion.gif" width="85" height="13" alt="画像を拡大する" id="expansion_<!--{$lkey|h}-->" />
                            <!--{/if}-->
                        </a>
                    </div>
                <!--{/if}-->
                <!--▲サブ画像-->
            </div>
        <!--{/if}-->
    <!--{/section}-->
    <!--▲サブコメント-->

    <!--▼関連商品-->
    <!--{if $arrRecommend}-->
        <div id="whoboughtarea">
            <h3>その他のオススメ商品</h3>
            <div class="whoboughtblock">

            <!--{section name=cnt loop=$arrRecommend}-->
                <!--{if ($smarty.section.cnt.index % 2) == 0}-->
                <!--{if $arrRecommend[cnt].product_id}-->
                <!-- 左列 -->
                <div class="whoboughtleft">

                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrRecommend[cnt].product_id|u}-->">
                        <img src="<!--{$smarty.const.ROOT_URLPATH}-->resize_image.php?image=<!--{$arrRecommend[cnt].main_list_image|sfNoImageMainList|h}-->&amp;width=65&amp;height=65" alt="<!--{$arrRecommend[cnt].name|h}-->" /></a>

                    <div class="whoboughtrightblock">
                        <!--{assign var=price02_min value=`$arrRecommend[cnt].price02_min`}-->
                        <!--{assign var=price02_max value=`$arrRecommend[cnt].price02_max`}-->
                        <h3><a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrRecommend[cnt].product_id|u}-->"><!--{$arrRecommend[cnt].name|h}--></a></h3>

                        <p class="sale_price"><!--{$smarty.const.SALE_PRICE_TITLE}-->(税込):<span class="price">
                            <!--{if $price02_min == $price02_max}-->
                                <!--{$price02_min|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->
                            <!--{else}-->
                                <!--{$price02_min|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->～<!--{$price02_max|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->
                            <!--{/if}-->円</span></p>
                        <p class="mini"><!--{$arrRecommend[cnt].comment|h|nl2br}--></p>
                    </div>
                </div>
                <!-- 左列 -->
                <!--{/if}-->
                <!--{/if}-->

                <!--{if ($smarty.section.cnt.index % 2) != 0}-->
                <!--{* assign var=nextCnt value=$smarty.section.cnt.index+1 *}-->
                <!--{if $arrRecommend[cnt].product_id}-->
                <!-- 右列 -->
                <div class="whoboughtright">

                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrRecommend[cnt].product_id|u}-->">
                        <img src="<!--{$smarty.const.ROOT_URLPATH}-->resize_image.php?image=<!--{$arrRecommend[cnt].main_list_image|sfNoImageMainList|h}-->&amp;width=65&amp;height=65" alt="<!--{$arrRecommend[cnt].name|h}-->" /></a>

                    <div class="whoboughtrightblock">
                        <!--{assign var=price02_min value=`$arrRecommend[cnt].price02_min`}-->
                        <!--{assign var=price02_max value=`$arrRecommend[cnt].price02_max`}-->
                        <h3><a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrRecommend[cnt].product_id|u}-->"><!--{$arrRecommend[cnt].name|h}--></a></h3>

                        <p class="sale_price"><!--{$smarty.const.SALE_PRICE_TITLE}-->(税込):<span class="price">

                            <!--{if $price02_min == $price02_max}-->
                                <!--{$price02_min|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->
                            <!--{else}-->
                                <!--{$price02_min|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->～<!--{$price02_max|sfCalcIncTax:$arrSiteInfo.tax:$arrSiteInfo.tax_rule|number_format}-->
                            <!--{/if}-->円</span></p>
                        <p class="mini"><!--{$arrRecommend[cnt].comment|h|nl2br}--></p>
                    </div>
                </div>
                <!-- 右列 -->
            <!--{/if}-->
            <!--{/if}-->

            <!--{if $smarty.section.cnt.last}-->
            </div>
            <!--{/if}-->
        <!--{/section}-->
        </div>
    <!--{/if}-->
    <!--▲関連商品-->

</div>
<!--▲CONTENTS-->
