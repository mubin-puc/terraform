import pytest
import tftest


@pytest.fixture(scope="module")
def plan_out(fixtures_dir):
  import json
  with open('%s/tfplan3.json' % fixtures_dir) as fp:
    return tftest.TerraformPlanOutput(json.load(fp))

#To test variables 
def test_variables(plan_out):
  var =  plan_out.variables['project_defaults'] 
  assert var['bucket_logs'] == 'gs://jabv-dev-aidplt-0-usre-logs'
  assert var['email_from_address'] == 'donotreply@verizon.com'


#To test resources in block 1  
def test_resources1(plan_out):
  res = plan_out.root_module['child_modules'][0]['resources'][0]
  assert res['address'] == 'module.aidplt-chatbot-jabv.google_compute_instance.compute_instance'
  assert res['mode'] == 'managed'

#To test nested resources in block 1
def test_nestedresources1(plan_out):
  nres1 = plan_out.root_module['child_modules'][0]['resources'][0]['values']
  nres1_a =  nres1['attached_disk'][0]
  nres1_b =  nres1['boot_disk'][0]
  assert nres1['advanced_machine_features'] == []
  assert nres1_a['device_name'] == 'persistent-disk-1'

#To test nested resources in block 2 
def test_nestedresources2(plan_out):
  nres2 = plan_out.root_module['child_modules'][1]['resources'][0]
  assert nres2['address'] == 'abc'




# def test_output_attributes(plan_out):
#   assert plan_out.format_version == "0.1"
#   assert plan_out.terraform_version == "0.12.6"

# def test_variables(plan_out):
#   a = plan_out.variables['project_defaults']
#   assert a['bucket_logs'] == 'abc'

# def test_resources(plan_out):
#     a = plan_out.root_module
#     b = a['child_modules'][0]['resources']
#     c = b[0]['values']
#     d = c['boot_disk']
#         #c = b[{'address':\ 'module.aidplt-chatbot-jabv'}]
#     assert d == 'abc'


# def test_resource_changes(plan_out):
#   address = 'module.resource-change.foo_resource.somefoo'
#   change = plan_out.resource_changes[address]
#   assert change['address'] == address
#   assert change['change']['before'] is None


# def test_output_changes(plan_out):
#   change = plan_out.output_changes['spam']
#   assert change['after'] == 'bar'


# def test_configuration(plan_out):
#   assert plan_out.configuration['provider_config']['google']['name'] == 'google'


# def test_root_module(plan_out):
#   mod = plan_out.root_module
#   assert plan_out.modules == mod.child_modules
#   assert plan_out.resources == mod.resources


# def test_resources(plan_out):
#   res = plan_out.resources['spam.somespam']
#   assert res['address'] == 'spam.somespam'
#   assert res['values']['spam-value'] == 'spam'


# def test_modules(plan_out):
#   mod = plan_out.modules['module.parent']
#   assert mod['address'] == 'module.parent'
#   res = mod.resources['foo.somefoo']
#   assert res['address'] == 'module.parent.foo.somefoo'
#   assert res['values']['foo-value'] == 'foo'


# def test_child_modules(plan_out):
#   mod = plan_out.modules['module.parent'].child_modules['module.child']
#   assert mod.resources['eggs.someeggs']['values']['eggs-value'] == 'eggs'


# def test_plan_with_no_resources_succeeds(fixtures_dir):
#   tf = tftest.TerraformTest('plan_no_resource_changes', fixtures_dir)
#   result = tf.plan(output=True)

#   assert result.outputs['just_an_output'] == 'Hello, plan!'


# def test_plan_stdout(fixtures_dir):
#   tf = tftest.TerraformTest('plan_no_resource_changes', fixtures_dir)
#   result = tf.plan(output=False)
#   assert 'just_an_output = "Hello, plan!"' in result