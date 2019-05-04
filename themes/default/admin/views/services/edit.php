<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-edit"></i><?= lang('edit_service'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <p class="introtext"><?php echo lang('update_info'); ?></p>
                <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form');
                echo admin_form_open_multipart("services/edit/" . $service->id, $attrib)
                ?>
                  <div class="col-md-5">
                    <div class="form-group all">
                        <?= lang("type_of_services", "type_of_services") ?>
                        <?= form_input('type_of_services', (isset($_POST['type_of_services']) ? $_POST['type_of_services'] : ($service ? $service->type_of_services : '')), 'class="form-control gen_slug" id="type_of_services" required="required"'); ?>
                    </div>
                    <div class="form-group all">
                        <?= lang("product", "product") ?>
                            <?= form_input('product', (isset($_POST['product']) ? $_POST['product'] : ($service ? $service->product : '')), 'class="form-control" id="product"  required="required"') ?>
                    </div>
                     <div class="form-group all">
                        <?= lang("service_charges", "service_charges") ?>
                        <?= form_input('service_charges', (isset($_POST['service_charges']) ? $_POST['service_charges'] : ($service ? $service->service_charges : '')), 'class="form-control gen_slug" id="service_charges" required="required"'); ?>
                    </div>
                    <div class="form-group all">
                        <?= lang("details", "details") ?>
                            <?= form_input('details', (isset($_POST['details']) ? $_POST['details'] : ($service ? $service->details : '')), 'class="form-control" id="details"  required="required"') ?>
                    </div>
                    <div class="form-group">
                        <?php echo form_submit('add_service', $this->lang->line("update_service"), 'class="btn btn-primary"'); ?>
                    </div>

                </div>
                
                <?= form_close(); ?>

            </div>

        </div>
    </div>
</div>

