package java;

public class fileRename {

    //upload하는 과정에서 file을 rename을 하기에는 힘드니 file class에 있는 renameTo 함수를 이용해서 이름을 변경한다.
    public void fileRename(String originFileName, String toRenameFileName) {
        java.io.File originFile = new java.io.File(originFileName);
        java.io.File toRenameFile = new java.io.File(toRenameFileName);
        originFile.renameTo(toRenameFile);
    }

}
