package com.epiccodez.shaadi_book;

import static android.os.FileUtils.copy;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class FlipActivity extends AppCompatActivity {

    private CurlView mCurlView;
    private List<Bitmap> bitMapImages = new ArrayList<Bitmap>();
    // Bitmap resources.
    private int[] mBitmapIds = {R.drawable.flip_one, R.drawable.flip_two, R.drawable.flip_three,
            R.drawable.flip_four, R.drawable.flip_five, R.drawable.flip_six, R.drawable.flip_seven,
            R.drawable.flip_eight, R.drawable.flip_nine, R.drawable.flip_ten, R.drawable.flip_ele, R.drawable.flip_tw,};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.flip_book);
        createImageArrays();

        int index = 0;
        if (getLastNonConfigurationInstance() != null) {
            index = (Integer) getLastNonConfigurationInstance();
        }
        // Define ActionBar object
        ActionBar actionBar;
        actionBar = getSupportActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);
        ColorDrawable colorDrawable
                = new ColorDrawable(Color.parseColor("#130F26"));
        // Set BackgroundDrawable
        actionBar.setBackgroundDrawable(colorDrawable);
        actionBar.setElevation(0f);
//        if (getSupportActionBar() != null) {
//            getSupportActionBar().hide();
//        }

        mCurlView = (CurlView) findViewById(R.id.curl);
        mCurlView.setPageProvider(new PageProvider());
        mCurlView.setSizeChangedObserver(new SizeChangedObserver());
        mCurlView.setCurrentIndex(index);
        mCurlView.setBackgroundColor(0xFF130F26);
    }

    void createImageArrays() {
        // cover
        bitMapImages.add(BitmapFactory.decodeResource(getResources(), R.drawable.auth_common));

        BitmapFactory.Options o = new BitmapFactory.Options();

        o.inTargetDensity = DisplayMetrics.DENSITY_DEFAULT;
        for (int bitmap : mBitmapIds) {
            Bitmap bmp = BitmapFactory.decodeResource(getResources(), bitmap);
            int w = bmp.getWidth();
            int h = bmp.getHeight();
            Matrix matrix = new Matrix();

            matrix.postScale(-1, 1, w / 2f, h / 2f);
            Bitmap bMapScaled = Bitmap.createScaledBitmap(bmp, w, h, true);

            bitMapImages.add(Bitmap.createBitmap(bMapScaled, 0, 0, w / 2, h, matrix, true));
            bitMapImages.add(Bitmap.createBitmap(bMapScaled, w / 2, 0, w / 2, h));
        }
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }

    @Override
    public void onPause() {
        super.onPause();
        mCurlView.onPause();
    }

    @Override
    public void onResume() {
        super.onResume();
        mCurlView.onResume();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    @Nullable
    @Override
    public Object onRetainCustomNonConfigurationInstance() {
        return mCurlView.getCurrentIndex();
    }

    /**
     * Bitmap provider.
     */
    private class PageProvider implements CurlView.PageProvider {

        // Bitmap resources.
        private int[] mBitmapIds = {R.drawable.flip_one, R.drawable.flip_eight, R.drawable.auth_common, R.drawable.get_started_first, R.drawable.get_started_second, R.drawable.get_started_third,};

        @Override
        public int getPageCount() {
            return (bitMapImages.size() / 2) + 1;
        }

        private int lastPageIndex = 0;
        private int imageIndex = 0;

        private Bitmap loadBitmap(int width, int height, int index) {
            Bitmap b = Bitmap.createBitmap(width, height,
                    Bitmap.Config.ARGB_8888);
            b.eraseColor(0xFFFFFFFF);
            Canvas c = new Canvas(b);
//            Drawable d = getResources().getDrawable(mBitmapIds[index]);
            Drawable d = new BitmapDrawable(getResources(), bitMapImages.get(index));

            int margin = 0;
            int border = 0;
            Rect r = new Rect(margin, margin, width - margin, height - margin);

//            int imageWidth = r.width() - (border * 2);
            int imageWidth = b.getWidth();
//            int imageHeight = imageWidth * d.getIntrinsicHeight()
//                    / d.getIntrinsicWidth();
            int imageHeight = b.getHeight();

            if (imageHeight > r.height() - (border * 2)) {
                imageHeight = r.height() - (border * 2);
                imageWidth = imageHeight * d.getIntrinsicWidth()
                        / d.getIntrinsicHeight();
            }

            r.left += ((r.width() - imageWidth) / 2) - border;
            r.right = r.left + imageWidth + border + border;
            r.top += ((r.height() - imageHeight) / 2) - border;
            r.bottom = r.top + imageHeight + border + border;

            Paint p = new Paint();
            p.setColor(0xFFC0C0C0);
            c.drawRect(r, p);
            r.left += border;
            r.right -= border;
            r.top += border;
            r.bottom -= border;

            d.setBounds(r);
            d.draw(c);

            return b;
        }

        @RequiresApi(api = Build.VERSION_CODES.Q)
        @Override
        public void updatePage(CurlPage page, int width, int height, int index) {
            switch (index) {
                // First case is image on front side, solid colored back.
                case 0: {
                    Bitmap front = loadBitmap(width, height, index);
                    Bitmap back = loadBitmap(width, height, index + 1);
//                    URL url = new URL("https://rukminim1.flixcart.com/image/416/416/jy1v7gw0/cases-covers/back-cover/v/b/k/likedesign-alk-bmtp-k20-8-original-imafgcyyzrmwk4pm.jpeg?q=70");
//                    Bitmap bmp = BitmapFactory.decodeStream(url.openConnection().getInputStream());
//                    Bitmap front = donwloadBitmap("https://rukminim1.flixcart.com/image/416/416/jy1v7gw0/cases-covers/back-cover/v/b/k/likedesign-alk-bmtp-k20-8-original-imafgcyyzrmwk4pm.jpeg?q=70");
                    page.setTexture(front, CurlPage.SIDE_FRONT);
                    page.setTexture(back, CurlPage.SIDE_BACK);
//                    lastPageIndex = 1;
//                    imageIndex = index;
//                    page.setColor(Color.rgb(180, 180, 180), CurlPage.SIDE_BACK);
                    break;
                }
                case 12: {
                    Bitmap front = loadBitmap(width, height, index * 2);
                    Bitmap back = loadBitmap(width, height, 0);
                    page.setTexture(front, CurlPage.SIDE_FRONT);
                    page.setTexture(back, CurlPage.SIDE_BACK);
                    break;
                }
                default: {
                    Bitmap front = loadBitmap(width, height, index * 2);
                    Bitmap back = loadBitmap(width, height, (index * 2) + 1);
                    page.setTexture(front, CurlPage.SIDE_FRONT);
                    page.setTexture(back, CurlPage.SIDE_BACK);
                    break;
                }
//                case 2: {
//                    Bitmap front = loadBitmap(width, height, 4);
//                    Bitmap back = loadBitmap(width, height, 5);
//                    page.setTexture(front, CurlPage.SIDE_FRONT);
//                    page.setTexture(back, CurlPage.SIDE_BACK);
//                    break;
//                }
//                case 3: {
//                    Bitmap front = loadBitmap(width, height, 6);
//                    Bitmap back = loadBitmap(width, height, 7);
//                    page.setTexture(front, CurlPage.SIDE_FRONT);
//                    page.setTexture(back, CurlPage.SIDE_BACK);
//                    break;
//                }
//                case 4: {
//                    Bitmap front = loadBitmap(width, height, 8);
//                    Bitmap back = loadBitmap(width, height, 9);
//                    page.setTexture(front, CurlPage.SIDE_FRONT);
//                    page.setTexture(back, CurlPage.SIDE_BACK);
//                    break;
//                }

//                // Second case is image on back side, solid colored front.
//                case 1: {
//                    Bitmap back = loadBitmap(width, height, 1);
//                    page.setTexture(back, CurlPage.SIDE_BACK);
//                    page.setColor(Color.rgb(127, 140, 180), CurlPage.SIDE_FRONT);
//                    break;
//                }
//                // Third case is images on both sides.
//                case 2: {
//                    Bitmap front = loadBitmap(width, height, 1);
//                    Bitmap back = loadBitmap(width, height, 3);
//                    page.setTexture(front, CurlPage.SIDE_FRONT);
//                    page.setTexture(back, CurlPage.SIDE_BACK);
//                    break;
//                }
//                // Fourth case is images on both sides - plus they are blend against
//                // separate colors.
//                case 3: {
//                    Bitmap front = loadBitmap(width, height, 2);
//                    Bitmap back = loadBitmap(width, height, 1);
//                    page.setTexture(front, CurlPage.SIDE_FRONT);
//                    page.setTexture(back, CurlPage.SIDE_BACK);
////                    page.setColor(Color.rgb(170, 130, 255),
////                            CurlPage.SIDE_FRONT);
////                    page.setColor(Color.rgb(255, 190, 150), CurlPage.SIDE_BACK);
//                    break;
//                }
//                // Fifth case is same image is assigned to front and back. In this
//                // scenario only one texture is used and shared for both sides.
//                case 4:
//                    Bitmap front = loadBitmap(width, height, 0);
//                    page.setTexture(front, CurlPage.SIDE_BOTH);
////                    page.setColor(Color.argb(127, 255, 255, 255),
////                            CurlPage.SIDE_BACK);
//                    break;
            }
        }
    }

    /**
     * CurlView size changed observer.
     */
    private class SizeChangedObserver implements CurlView.SizeChangedObserver {
        @Override
        public void onSizeChanged(int w, int h) {
            if (w > h) {
                mCurlView.setViewMode(CurlView.SHOW_TWO_PAGES);
                mCurlView.setMargins(.1f, .15f, .1f, .15f);
            } else {
                mCurlView.setViewMode(CurlView.SHOW_ONE_PAGE);
                mCurlView.setMargins(.1f, .1f, .1f, .1f);
            }
        }
    }
}