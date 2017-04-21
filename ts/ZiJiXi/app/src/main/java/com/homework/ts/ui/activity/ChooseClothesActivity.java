package com.homework.ts.ui.activity;

import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.LinearLayout;
import android.widget.RadioButton;

import com.android.volley.Request;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.google.gson.Gson;
import com.homework.ts.adapter.ClothesGridAdapter;
import com.homework.ts.model.Address;
import com.homework.ts.model.Clothes;
import com.homework.ts.util.Constant;
import com.homework.ts.zijixi.BaseActivity;
import com.homework.ts.zijixi.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

/**
 * Created by ts on 2017/4/14.
 */

public class ChooseClothesActivity extends BaseActivity {
    private String TAG = "ChooseClothesActivity";
    private LinearLayout container;
    private Toolbar toolbar;
    private int categoryID;

    private GridView gv;

    private ArrayList<Clothes> clothesList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_choose_clothes);

        container = (LinearLayout) findViewById(R.id.container);
//        initSystemBar(container);

        toolbar = initToolBar("专业清洗");

        categoryID = getIntent().getIntExtra("categoryID",1);
        getProducts(categoryID);

        initView();

    }

    public void initView(){
        gv = (GridView) this.findViewById(R.id.gridView1);
        ClothesGridAdapter adapter = new ClothesGridAdapter(this,clothesList);
        gv.setAdapter(adapter);


        gv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                // TODO Auto-generated method stub
                showToast("arg2="+arg2+"  arg3="+arg3);
            }
        });
    }

    public void getProducts(int categoryID){
        String url = Constant.MY_UTL + "products/get_products.json?category_id=" + String.valueOf(categoryID);

        Log.i("TAG", url);

        JsonObjectRequest jsonObjRequest = new JsonObjectRequest(Request.Method.GET, url, null,
                new com.android.volley.Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {

                        int result = 0;
                        try {
                            result = response.getInt("status");

                            Log.i(TAG,  "/" + response.toString());

                            if (result == 200) {
                                Gson gson = new Gson();
                                JSONArray jsonArray = response.getJSONArray("product");

                                for (int i = 0; i < jsonArray.length(); i++) {
                                    JSONObject jo = jsonArray.getJSONObject(i);
                                    Log.i(TAG,"jo=="+jo.toString());

                                    Clothes clothes = gson.fromJson(jsonArray.getString(i), Clothes.class);

                                    clothesList.add(clothes);
                                }
                            }else{

                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                            Log.e("Json e", e.getMessage());
                        }
                    }
                }, new com.android.volley.Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.i(TAG,"ERROR");
            }
        });
        Log.i(TAG,"jsonObjRequest==/"+jsonObjRequest.toString());
        Constant.queue.add(jsonObjRequest);

    }
}
