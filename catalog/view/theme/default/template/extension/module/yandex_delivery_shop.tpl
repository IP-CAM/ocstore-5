<h2><?php echo $heading_title_shop; ?></h2>
<div id="ydcontent">
    <div class="form-group required">
        <label class="control-label" for="input-order-number"><?php echo $text_search_order_num; ?></label>
        <input type="text" name="searchNum" size="8" id="input-order-number" class="form-control">
        <label class="control-label" for="input-order-phone"><?php echo $text_search_phone_num; ?></label>
        <input type="text" name="phoneNum" size="4" id="input-order_phone" class="form-control">
        <br>
        <button type="button" onclick="checkYd(); return false;" id="button-search-yd" class="btn btn-primary btn-lg btn-block"><?php echo $text_search_order_button; ?></button>
    </div>
</div>
<div class="yd-loading" style="display:none">
    <div class="yd-loading-text"><?php echo $text_please_wait; ?></div>
    <img src="catalog/view/image/loading.gif" alt="" />
</div>
<div id="yddata" style="display: none;">
    <div class="table-responsive">
        <table id="statushistory" class="table table-bordered table-hover">
            <thead>
            <tr>
                <td class="text-left"><?php echo $column_time; ?></td>
                <td class="text-left"><?php echo $column_status; ?></td>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div class="item text-left">
        <span><strong><?php echo $text_address; ?>:</strong></span>&nbsp;<span id="yd-address"></span>
    </div>
    <div class="item text-left">
        <span><strong><?php echo $text_delivery_est; ?>:</strong></span>&nbsp;<span id="yd-est"></span>
    </div>
</div>
<script type="text/javascript"><!--
    function checkYd() {
        $('#yderror').remove();

        $.ajax({
            type: 'POST',
            url: 'index.php?route=<?php echo $module_route; ?>/getStatus',
            data: $('input[name=\'searchNum\'], input[name=\'phoneNum\']'),
            beforeSend: function() {
                $('.yd-loading').show();
            },
            complete: function() {
                $('.yd-loading').hide();
            },
            success: function(data) {
                $('.yd-loading').hide();
                if (data.hasOwnProperty('error')) {
                    $("#yddata").hide();
                    $('#ydcontent').append("<div class='text-danger' id='yderror'><span>"+data.error+"</span></div>");
                }
                else {
                    $("#statushistory tbody").empty();
                    $.each(data.history, function(key, value) {
                        var tr = "<tr><td>" + value.time + "</td><td>" + value.status + "</td></tr>";
                        $("#statushistory tbody").append(tr);
                    });
                    $("#yd-address").html(data.address);
                    $("#yd-est").html(data.est);
                    $("#yddata").show();
                }
            }
        });
    }
//--></script>