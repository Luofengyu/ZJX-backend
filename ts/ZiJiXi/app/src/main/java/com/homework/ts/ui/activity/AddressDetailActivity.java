package com.homework.ts.ui.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.JsonRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;
import com.homework.ts.adapter.AddressAdapter;
import com.homework.ts.model.Address;
import com.homework.ts.model.User;
import com.homework.ts.ui.fragment.MyFragment;
import com.homework.ts.util.Constant;
import com.homework.ts.view.ProgressWheel;
import com.homework.ts.zijixi.BaseActivity;
import com.homework.ts.zijixi.R;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ts on 2017/3/25.
 */

public class AddressDetailActivity extends BaseActivity {
    private String TAG = "AddressDetailActivity";
    private LinearLayout container;
    private EditText editCity, editDistrict, editName, editPhone, editAddress1, editAddress2;
    private RadioButton radioMale, radioFemale;
    private Button deletaButton;
    private Toolbar toolbar;
    private int position, address_id;
    private String city, district, name, phone, address1, address2;
    private String sex; // 0-femail, 1-male
    private int fromwhere; // 0-添加, 1-详情


    private ArrayList<Address> allAddressesList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_address_detail);

        container = (LinearLayout) findViewById(R.id.container);
//        initSystemBar(container);

        toolbar = initToolBar("填写地址");
        initMenu(toolbar);

        initView();

    }

    protected void initView(){
        Intent intent = getIntent();

        editCity = (EditText) findViewById(R.id.address_edit_city);
        editDistrict = (EditText) findViewById(R.id.address_edit_district);
        editAddress1 = (EditText) findViewById(R.id.address_edit_address1);
        editAddress2 = (EditText) findViewById(R.id.address_edit_address2);
        editName = (EditText) findViewById(R.id.address_edit_name);
        editPhone = (EditText) findViewById(R.id.address_edit_phone);
        radioMale = (RadioButton) findViewById(R.id.radioMale);
        radioFemale = (RadioButton) findViewById(R.id.radioFemale);
        deletaButton = (Button) findViewById(R.id.button_delete_address);

        position = intent.getIntExtra("position", 0);
        address_id = intent.getIntExtra("id",0);
        fromwhere = intent.getIntExtra("fromwhere",-1);
        Log.i(TAG,"fromwhere=="+fromwhere);
        if(fromwhere == 1){// 详情
            city = intent.getStringExtra("city");
            district = intent.getStringExtra("district");
            address1 = intent.getStringExtra("address1");
            address2 = intent.getStringExtra("address2");
            name = intent.getStringExtra("name");
            phone = intent.getStringExtra("phone");
            sex = intent.getStringExtra("sex");

            Log.i(TAG,"sex=="+sex);

            editCity.setText(city);
            editDistrict.setText(district);
            editAddress1.setText(address1);
            editAddress2.setText(address2);
            editName.setText(name);
            editPhone.setText(phone);
            if(sex.equals("男")){
                radioMale.setChecked(true);
                radioFemale.setChecked(false);
            }else if(sex.equals("女")){
                radioFemale.setChecked(true);
                radioMale.setChecked(false);
            }else{
                radioFemale.setChecked(false);
                radioMale.setChecked(false);
            }

            deletaButton.setVisibility(View.VISIBLE);

            deletaButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    deleteAddress(address_id);
//                    Constant.allAddressesList.remove(position);
//                    AddressListActivity.adapter.notifyDataSetChanged();
                }
            });
        }else{// 添加
            deletaButton.setVisibility(View.GONE);
        }
    }

    private void initMenu(Toolbar toolbar) {
        TextView subView = new TextView(this);
        subView.setTextColor(getResources().getColor(R.color.white));
        subView.setText("保存");
        subView.setTextSize(18);
        //设定布局的各种参数
        Toolbar.LayoutParams params = new Toolbar.LayoutParams(
                Toolbar.LayoutParams.WRAP_CONTENT,
                Toolbar.LayoutParams.WRAP_CONTENT,
                Gravity.RIGHT);
        params.setMargins(3, 3, 30, 3);//设置外边界
        subView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(radioMale.isSelected()){
                    sex = "男";
                }else if (radioFemale.isSelected()){
                    sex = "女";
                }else{
                    sex = "";
                }
                Log.i(TAG,"save Button Sex=="+sex);

                name = editName.getText().toString();
                phone = editPhone.getText().toString();
                city = editCity.getText().toString();
                district = editDistrict.getText().toString();
                address1 = editAddress1.getText().toString();
                address2 = editAddress2.getText().toString();

                if(fromwhere == 0){//添加
                    addAddress(name, phone, sex, city, district, address1, address2, Constant.lontitude, Constant.latitude);
                }else{//修改
                    updateAddress(name, phone, sex, city, district, address1, address2, Constant.lontitude, Constant.latitude);
                }
            }
        });
        subView.setLayoutParams(params);
        toolbar.addView(subView);
    }

    public void addAddress(String name, String tel, String sex, String city, String region, String community, String house_number, float lng, float lat){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        String httpurl = Constant.MY_UTL + "addresses/create_user_address";

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("user_id",User.getInstance().getId());
        params.put("name",name);
        params.put("tel", tel);
        params.put("sex",sex);
        params.put("city", city);
        params.put("region", region);
        params.put("community", community);
        params.put("house_number", house_number);
        params.put("lng", lng);
        params.put("lat", lat);

        JSONObject jsonObject = new JSONObject(params);
        JsonRequest<JSONObject> jsonRequest = new JsonObjectRequest(Request.Method.POST, httpurl, jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        Log.d(TAG, "response -> " + response.toString());

                        String result = null;
                        try {
                            result = response.getString("status");

                            if (result.equals("200")) {
                                Toast.makeText(getApplicationContext(), "添加成功", Toast.LENGTH_SHORT).show();

                                JSONObject resultAddress = response.getJSONObject("user_address");
                                Log.i("Result", resultAddress + "");
                                Gson gson = new Gson();
                                Address address = gson.fromJson(resultAddress.toString(), Address.class);

                                Constant.allAddressesList.add(address);
                                AddressListActivity.adapter.notifyDataSetChanged();
                                finish();
                            }

                            if (result.equals("555")) {
                                String message = response.getString("message");
                                if (message.equals("wrong")){
                                    Toast.makeText(getApplicationContext(), "添加错误", Toast.LENGTH_SHORT).show();
                                }else{
                                    Toast.makeText(getApplicationContext(), "添加失败", Toast.LENGTH_SHORT).show();

                                }
                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(getApplicationContext(), "未知错误", Toast.LENGTH_SHORT).show();
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e(TAG, error.getMessage(), error);
                Toast.makeText(getApplicationContext(), "未知错误", Toast.LENGTH_SHORT).show();
            }
        })
        {
            @Override
            public Map<String, String> getHeaders() {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put("Accept", "application/json");
                headers.put("Content-Type", "application/json; charset=UTF-8");

                return headers;
            }
        };
        requestQueue.add(jsonRequest);
    }


    public void updateAddress(String name, String tel, String sex, String city, String region, String community, String house_number, float lng, float lat){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        String httpurl = Constant.MY_UTL + "addresses/update_user_address";

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id",address_id);
        params.put("name",name);
        params.put("tel", tel);
        params.put("sex",sex);
        params.put("city", city);
        params.put("region", region);
        params.put("community", community);
        params.put("house_number", house_number);
        params.put("lng", lng);
        params.put("lat", lat);

        JSONObject jsonObject = new JSONObject(params);
        JsonRequest<JSONObject> jsonRequest = new JsonObjectRequest(Request.Method.POST, httpurl, jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        Log.d(TAG, "response -> " + response.toString());

                        String result = null;
                        try {
                            result = response.getString("status");

                            if (result.equals("200")) {
                                Toast.makeText(getApplicationContext(), "修改成功", Toast.LENGTH_SHORT).show();

                                JSONObject resultAddress = response.getJSONObject("user_address");
                                Log.i("Result", resultAddress + "");
                                Gson gson = new Gson();
                                Address address = gson.fromJson(resultAddress.toString(), Address.class);

                                Constant.allAddressesList.get(position).setName(address.getName());
                                Constant.allAddressesList.get(position).setTel(address.getTel());
                                Constant.allAddressesList.get(position).setSex(address.getSex());
                                Constant.allAddressesList.get(position).setCity(address.getCity());
                                Constant.allAddressesList.get(position).setRegion(address.getRegion());
                                Constant.allAddressesList.get(position).setCommunity(address.getCommunity());
                                Constant.allAddressesList.get(position).setHouse_number(address.getHouse_number());

                                AddressListActivity.adapter.notifyDataSetChanged();

                                finish();
                            }

                            if (result.equals("555")) {
                                String message = response.getString("message");
                                if (message.equals("wrong")){
                                    Toast.makeText(getApplicationContext(), "修改错误", Toast.LENGTH_SHORT).show();
                                }else{
                                    Toast.makeText(getApplicationContext(), "修改失败", Toast.LENGTH_SHORT).show();

                                }
                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(getApplicationContext(), "未知错误", Toast.LENGTH_SHORT).show();
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e(TAG, error.getMessage(), error);
                Toast.makeText(getApplicationContext(), "未知错误", Toast.LENGTH_SHORT).show();
            }
        })
        {
            @Override
            public Map<String, String> getHeaders() {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put("Accept", "application/json");
                headers.put("Content-Type", "application/json; charset=UTF-8");

                return headers;
            }
        };
        requestQueue.add(jsonRequest);
    }

    public void deleteAddress(int id){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        String httpurl = Constant.MY_UTL + "addresses/delete_user_address";

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id",id);


        JSONObject jsonObject = new JSONObject(params);
        JsonRequest<JSONObject> jsonRequest = new JsonObjectRequest(Request.Method.POST, httpurl, jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        Log.d(TAG, "response -> " + response.toString());

                        String result = null;
                        try {
                            result = response.getString("status");

                            if (result.equals("200")) {
                                Toast.makeText(getApplicationContext(), "删除成功", Toast.LENGTH_SHORT).show();

//                                JSONObject resultAddress = response.getJSONObject("user_address");
//                                Log.i("Result", resultAddress + "");
//                                Gson gson = new Gson();
//                                Address address = gson.fromJson(resultAddress.toString(), Address.class);

                                Constant.allAddressesList.remove(position);
                                AddressListActivity.adapter.notifyDataSetChanged();

                                finish();
                            }

                            if (result.equals("555")) {
                                String message = response.getString("message");
                                if (message.equals("wrong")){
                                    Toast.makeText(getApplicationContext(), "添加错误", Toast.LENGTH_SHORT).show();
                                }else{
                                    Toast.makeText(getApplicationContext(), "添加失败", Toast.LENGTH_SHORT).show();

                                }
                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                            Toast.makeText(getApplicationContext(), "未知错误", Toast.LENGTH_SHORT).show();
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e(TAG, error.getMessage(), error);
                Toast.makeText(getApplicationContext(), "未知错误", Toast.LENGTH_SHORT).show();
            }
        })
        {
            @Override
            public Map<String, String> getHeaders() {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put("Accept", "application/json");
                headers.put("Content-Type", "application/json; charset=UTF-8");

                return headers;
            }
        };
        requestQueue.add(jsonRequest);
    }

}
