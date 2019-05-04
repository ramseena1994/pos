<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<?php if ($Owner || $Admin) { ?>
    <ul id="myTab" class="nav nav-tabs">
        <li class=""><a href="#details" class="tab-grey"><?= lang('service_details') ?></a></li>
    </ul>

<div class="tab-content">
    <div id="details" class="tab-pane fade in">
        <?php } ?>
        <div class="box">
            <div class="box-header">
              

                <div class="box-icon">
                    <ul class="btn-tasks">
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang("actions") ?>"></i>
                            </a>
                            <ul class="dropdown-menu pull-right tasks-menus" role="menu"
                                aria-labelledby="dLabel">
                                <li>
                                    <a href="<?= admin_url('services/edit/' . $service->id) ?>">
                                        <i class="fa fa-edit"></i> <?= lang('edit') ?>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#" class="bpo" title="<b><?= lang("delete_service") ?></b>"
                                        data-content="<div style='width:150px;'><p><?= lang('r_u_sure') ?></p><a class='btn btn-danger' href='<?= admin_url('services/delete/' . $service->id) ?>'><?= lang('i_m_sure') ?></a> <button class='btn bpo-close'><?= lang('no') ?></button></div>"
                                        data-html="true" data-placement="left">
                                        <i class="fa fa-trash-o"></i> <?= lang('delete') ?>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="box-content">
                <div class="row">
                    <div class="col-lg-12">
                        <p class="introtext"><?php echo lang('service_details'); ?></p>

                        <div class="row">
                            
                            <div class="col-sm-7">
                                <div class="table-responsive">
                                    <table class="table table-borderless table-striped dfTable table-right-left">
                                        <tbody>
                                        
                                        <tr>
                                            <td><?= lang("type_of_services"); ?></td>
                                            <td><?php echo $service->type_of_services; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?= lang("product"); ?></td>
                                            <td><?php echo $service->product; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?= lang("service_charges"); ?></td>
                                            <td><?php echo $service->service_charges; ?></td>
                                        </tr>
                                        <tr>
                                            <td><?= lang("details"); ?></td>
                                            <td><?= $service ? $service->details : ''; ?></td>
                                        </tr>
                                       

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="col-sm-12">

                                <?= $service->details ? '<div class="panel panel-success"><div class="panel-heading">' . lang('service_details_for_product') . '</div><div class="panel-body">' . $service->product . '</div></div>' : ''; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       

       