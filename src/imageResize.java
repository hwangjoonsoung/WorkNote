import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

public class imageResize {

    //편하게 하려면 비율을 부여하는 것을 x로 하는것이 편하다

    public static boolean resizeImage(String originalPath, String targetPath, String format, int width, int height, String resizeType) {
        boolean retVal = false;

        //이미지 리사이즈 시작 =============
        String imgOriginalPath = originalPath;           // 원본 이미지 파일명
        String imgTargetPath = targetPath;   // 새 이미지 파일명
        String imgFormat = "jpg";                             // 새 이미지 포맷. jpg, gif 등
        int newWidth = 680;                                  // 변경 할 넓이
        int newHeight = 700;                                 // 변경 할 높이
        String mainPosition = "W";                             // W:넓이중심, H:높이중심, X:설정한 수치로(비율무시)

        if (format.equals("")) {
            imgFormat = format;
        }
        if (width != 0) {
            newWidth = width;
        }
        if (height != 0) {
            newHeight = height;
        }
        if (resizeType.equals("")) {
            resizeType = mainPosition;
        }

        Image image;
        int imageWidth;
        int imageHeight;
        double ratio;
        int w;
        int h;

        try {
            // 원본 이미지 가져오기
            image = ImageIO.read(new File(imgOriginalPath));

            // 원본 이미지 사이즈 가져오기
            imageWidth = image.getWidth(null);
            imageHeight = image.getHeight(null);

            if (resizeType.equals("W")) {    // 넓이기준

                if (imageWidth > newWidth) { //변경될 사이즈 보다 크다면
                    ratio = (double) newWidth / (double) imageWidth;
                    w = (int) (imageWidth * ratio);
                    h = (int) (imageHeight * ratio);
                } else {
                    w = imageWidth;
                    h = imageHeight;
                }

            } else if (resizeType.equals("H")) { // 높이기준

                if (imageWidth > newWidth) { //변경될 사이즈 보다 크다면
                    ratio = (double) newHeight / (double) imageHeight;
                    w = (int) (imageWidth * ratio);
                    h = (int) (imageHeight * ratio);
                } else {
                    w = imageWidth;
                    h = imageHeight;
                }

            } else { //설정값 (비율무시)

                w = newWidth;
                h = newHeight;
            }

            // 이미지 리사이즈
            // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
            // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
            // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
            // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
            // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
            Image resizeImage = image.getScaledInstance(w, h, Image.SCALE_SMOOTH);

            // 새 이미지  저장하기
            BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
            Graphics g = newImage.getGraphics();
            g.drawImage(resizeImage, 0, 0, null);
            g.dispose();
            ImageIO.write(newImage, imgFormat, new File(imgTargetPath));

            retVal = true;

        } catch (Exception e) {

            e.printStackTrace();

        }
        return retVal;
    }
}
