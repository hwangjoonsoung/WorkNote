package test;


enum EnumClass {

    //        AF("Afghanistan (아프가니스탄)"),
//        AX("Aland Islands (올란드 제도)"),
//        AL("Albania (알바니아)"),
//        DZ("Algeria (알제리)"),
//        AS("American Samoa (아메리칸사모아)"),
//        AD("Andorra (안도라)"),
//        AO("Angola (앙골라)"),
//        AI("Anguilla (앵귈라)"),
//        AQ("Antarctica (남극)"),
//        AG("Antigua And Barbuda (앤티가 바부다)"),
//        AR("Argentina (아르헨티나)"),
//        AM("Armenia (아르메니아)"),
//        AW("Aruba (아루바)"),
//        AU("Australia (오스트레일리아)"),
//        AT("Austria (오스트리아)"),
//        AZ("Azerbaijan (아제르바이잔)"),
//        BS("Bahamas (바하마)"),
//        BH("Bahrain (바레인)"),
//        BD("Bangladesh (방글라데시)"),
//        BB("Barbados (바베이도스)"),
//        BY("Belarus (벨라루스)"),
//        BE("Belgium (벨기에)"),
//        BZ("Belize (벨리즈)"),
//        BJ("Benin (베냉)"),
//        BM("Bermuda (버뮤다)"),
//        BT("Bhutan (부탄)"),
//        BO("Bolivia (볼리비아)"),
//        BA("Bosnia And Herzegovina (보스니아 헤르체고비나)"),
//        BW("Botswana (보츠와나)"),
//        BV("Bouvet Island (부베 섬)"),
//        BR("Brazil (브라질)"),
//        IO("British Indian Ocean Territory (영국령 인도양 지역)"),
//        BN("Brunei Darussalam (브루나이)"),
//        BG("Bulgaria (불가리아)"),
//        BF("Burkina Faso (부르키나파소)"),
//        BI("Burundi (부룬디)"),
//        KH("Cambodia (캄보디아)"),
//        CM("Cameroon (카메룬)"),
//        CA("Canada (캐나다)"),
//        CV("Cape Verde (카보베르데)"),
//        KY("Cayman Islands (케이맨 제도)"),
//        CF("Central African Republic (중앙아프리카 공화국)"),
//        TD("Chad (차드)"),
//        CL("Chile (칠레)"),
//        CN("China (중화인민공화국)"),
//        CX("Christmas Island (크리스마스 섬)"),
//        CC("Cocos (Keeling) Islands (코코스 제도)"),
//        CO("Colombia (콜롬비아)"),
//        KM("Comoros (코모로)"),
//        CG("Congo (콩고 공화국)"),
//        CD("Congo, The Democratic Republic Of The (콩고 민주 공화국)"),
//        CK("Cook Islands (쿡 제도)"),
//        CR("Costa Rica (코스타리카)"),
//        CI("Cote D'Ivoire (코트디부아르)"),
//        HR("Croatia (크로아티아)"),
//        CU("Cuba (쿠바)"),
//        CY("Cyprus (키프로스)"),
//        CZ("Czech Republic (체코)"),
//        DK("Denmark (덴마크)"),
//        DJ("Djibouti (지부티)"),
//        DM("Dominica (도미니카)"),
//        DO("Dominican Republic (도미니카 공화국)"),
//        EC("Ecuador (에콰도르)"),
//        EG("Egypt (이집트)"),
//        SV("El Salvador (엘살바도르)"),
//        GQ("Equatorial Guinea (적도 기니)"),
//        ER("Eritrea (에리트레아)"),
//        EE("Estonia (에스토니아)"),
//        ET("Ethiopia (에티오피아)"),
//        FK("Falkland Islands (Malvinas) (포클랜드 제도)"),
//        FO("Faroe Islands (페로 제도)"),
//        FJ("Fiji (피지)"),
//        FI("Finland (핀란드)"),
//        FR("France (프랑스)"),
//        GF("French Guiana (프랑스령 기아나)"),
//        PF("French Polynesia (프랑스령 폴리네시아)"),
//        TF("French Southern Territories (프랑스령 남부 지역)"),
//        GA("Gabon (가봉)"),
//        GM("Gambia (감비아)"),
//        GE("Georgia (그루지야)"),
//        DE("Germany (독일)"),
//        GH("Ghana (가나)"),
//        GI("Gibraltar (지브롤터)"),
//        GR("Greece (그리스)"),
//        GL("Greenland (그린란드)"),
//        GD("Grenada (그레나다)"),
//        GP("Guadeloupe (과들루프)"),
//        GU("Guam (괌)"),
//        GT("Guatemala (과테말라)"),
//        GN("Guinea (기니)"),
//        GW("Guinea-Bissau (기니비사우)"),
//        GY("Guyana (가이아나)"),
//        HT("Haiti (아이티)"),
//        HM("Heard Island And Mcdonald Islands (허드 맥도널드 제도)"),
//        VA("Holy See (Vatican City State) (바티칸 시국)"),
//        HN("Honduras (온두라스)"),
//        HK("Hong Kong (홍콩)"),
//        HU("Hungary (헝가리)"),
//        IS("Iceland (아이슬란드)"),
//        IN("India (인도)"),
//        ID("Indonesia (인도네시아)"),
//        IR("Iran, Islamic Republic Of (이란)"),
//        IQ("Iraq (이라크)"),
//        IE("Ireland (아일랜드)"),
//        IL("Israel (이스라엘)"),
//        IT("Italy (이탈리아)"),
//        JM("Jamaica (자메이카)"),
//        JP("Japan (일본)"),
//        JO("Jordan (요르단)"),
//        KZ("Kazakhstan (카자흐스탄)"),
//        KE("Kenya (케냐)"),
//        KI("Kiribati (키리바시)"),
//        KR("Korea, Republic Of (대한민국)"),
//        KW("Kuwait (쿠웨이트)"),
//        KG("Kyrgyzstan (키르기스스탄)"),
//        LA("Lao People'S Democratic Republic (라오스)"),
//        LV("Latvia (라트비아)"),
//        LB("Lebanon (레바논)"),
//        LS("Lesotho (레소토)"),
//        LR("Liberia (라이베리아)"),
//        LY("Libyan Arab Jamahiriya (리비아)"),
//        LI("Liechtenstein (리히텐슈타인)"),
//        LT("Lithuania (리투아니아)"),
//        LU("Luxembourg (룩셈부르크)"),
//        MO("Macao (마카오)"),
//        MK("Macedonia, The Former Yugoslav Republic Of (마케도니아 공화국)"),
//        MG("Madagascar (마다가스카르)"),
//        MW("Malawi (말라위)"),
//        MY("Malaysia (말레이시아)"),
//        MV("Maldives (몰디브)"),
//        ML("Mali (말리)"),
//        MT("Malta (몰타)"),
//        MH("Marshall Islands (마셜 제도)"),
//        MQ("Martinique (마르티니크)"),
//        MR("Mauritania (모리타니)"),
//        MU("Mauritius (모리셔스)"),
//        YT("Mayotte (마요트)"),
//        MX("Mexico (멕시코)"),
//        FM("Micronesia, Federated States Of (미크로네시아 연방)"),
//        MD("Moldova, Republic Of (몰도바)"),
//        MC("Monaco (모나코)"),
//        MN("Mongolia (몽골)"),
//        MS("Montserrat (몬트세랫)"),
//        MA("Morocco (모로코)"),
//        MZ("Mozambique (모잠비크)"),
//        MM("Myanmar (미얀마)"),
//        NA("Namibia (나미비아)"),
//        NR("Nauru (나우루)"),
//        NP("Nepal (네팔)"),
//        NL("Netherlands (네덜란드)"),
//        AN("Netherlands Antilles (네덜란드령 안틸레스)"),
//        NC("New Caledonia (누벨칼레도니)"),
//        NZ("New Zealand (뉴질랜드)"),
//        NI("Nicaragua (니카라과)"),
//        NE("Niger (니제르)"),
//        NG("Nigeria (나이지리아)"),
//        NU("Niue (니우에)"),
//        NF("Norfolk Island (노퍽 섬)"),
//        MP("Northern Mariana Islands (북마리아나 제도)"),
//        NO("Norway (노르웨이)"),
//        OM("Oman (오만)"),
//        PK("Pakistan (파키스탄)"),
//        PW("Palau (팔라우)"),
//        PS("Palestinian Territory, Occupied (팔레스타인)"),
//        PA("Panama (파나마)"),
//        PG("Papua New Guinea (파푸아 뉴기니)"),
//        PY("Paraguay (파라과이)"),
//        PE("Peru (페루)"),
//        PH("Philippines (필리핀)"),
//        PN("Pitcairn (핏케언 섬)"),
//        PL("Poland (폴란드)"),
//        PT("Portugal (포르투갈)"),
//        PR("Puerto Rico (푸에르토리코)"),
//        QA("Qatar (카타르)"),
//        RE("Reunion (레위니옹)"),
//        RO("Romania (루마니아)"),
//        RU("Russian Federation (러시아)"),
//        RW("Rwanda (르완다)"),
//        SH("Saint Helena (세인트헬레나)"),
//        KN("Saint Kitts And Nevis (세인트키츠 네비스)"),
//        LC("Saint Lucia (세인트루시아)"),
//        PM("Saint Pierre And Miquelon (생피에르 미클롱)"),
//        VC("Saint Vincent And The Grenadines (세인트빈센트 그레나딘)"),
//        WS("Samoa (사모아)"),
//        SM("San Marino (산마리노)"),
//        ST("Sao Tome And Principe (상투메 프린시페)"),
//        SA("Saudi Arabia (사우디아라비아)"),
//        SN("Senegal (세네갈)"),
//        CS("Serbia and Montenegro (세르비아 몬테네그로)"),
//        SC("Seychelles (세이셸)"),
//        SL("Sierra Leone (시에라리온)"),
//        SG("Singapore (싱가포르)"),
//        SK("Slovakia (슬로바키아)"),
//        SI("Slovenia (슬로베니아)"),
//        SB("Solomon Islands (솔로몬 제도)"),
//        SO("Somalia (소말리아)"),
//        ZA("South Africa (남아프리카 공화국)"),
//        GS("South Georgia And The South Sandwich Islands (사우스조지아 사우스샌드위치 제도)"),
//        ES("Spain (스페인)"),
//        LK("Sri Lanka (스리랑카)"),
//        SD("Sudan (수단)"),
//        SR("Suriname (수리남)"),
//        SJ("Svalbard And Jan Mayen (스발바르 얀마옌)"),
//        SZ("Swaziland (스와질란드)"),
//        SE("Sweden (스웨덴)"),
//        CH("Switzerland (스위스)"),
//        SY("Syrian Arab Republic (시리아)"),
//        TW("Taiwan, Province Of China (중화민국)"),
//        TJ("Tajikistan (타지키스탄)"),
//        TZ("Tanzania, United Republic Of (탄자니아)"),
//        TH("Thailand (타이)"),
//        TL("Timor-Leste (동티모르)"),
//        TG("Togo (토고)"),
//        TK("Tokelau (토켈라우 제도)"),
//        TO("Tonga (통가)"),
//        TT("Trinidad And Tobago (트리니다드 토바고)"),
//        TN("Tunisia (튀니지)"),
//        TR("Turkey (터키)"),
//        TM("Turkmenistan (투르크메니스탄)"),
//        TC("Turks And Caicos Islands (터크스 케이커스 제도)"),
//        TV("Tuvalu (투발루)"),
//        UG("Uganda (우간다)"),
//        UA("Ukraine (우크라이나)"),
//        AE("United Arab Emirates (아랍에미리트)"),
//        GB("United Kingdom (영국)"),
//        US("United States (미국)"),
//        UM("United States Minor Outlying Islands (미국령 군소 제도)"),
//        UY("Uruguay (우루과이)"),
    UZ("Uzbekistan (우즈베키스탄)"),
    VU("Vanuatu (바누아투)"),
    VE("Venezuela (베네수엘라)"),
    VN("Viet Nam (베트남)"),
    VG("Virgin Islands, British (영국령 버진아일랜드)"),
    VI("Virgin Islands, U.S. (미국령 버진아일랜드)"),
    WF("Wallis And Futuna (월리스 푸투나)"),
    EH("Western Sahara (서사하라)"),
    YE("Yemen (예멘)"),
    ZM("Zambia (잠비아)"),
    ZW("Zimbabwe (짐바브웨)");

    public String getS() {
        return this.s;
    }

    public void setS(String s) {

        this.s = s;
    }

    private String s;


    EnumClass(String s) {

    }

    public static String getName() {
        return EnumClass.EH.getS();
    }
    //진짜 스트림을 사용해야 할까?

    //code를 통해 country name 가져오기
   /* public static String findCountry(String code){
    }*/

    //code를 통해 country option code 생성
    public static void test() {
        for (EnumClass value : EnumClass.values()) {
            System.out.println(value);
        }

    }

    //code를 통해 country option code 생성 with class style


}

public class Company {

    public static void main(String[] args) {
        long asdas = 1000;
        int asdasda = (int) asdas;


    }
}

