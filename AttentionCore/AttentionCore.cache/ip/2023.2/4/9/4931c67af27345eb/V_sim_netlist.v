// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Feb 10 23:13:44 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ V_sim_netlist.v
// Design      : V
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "V,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [1:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [1:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [1:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "2" *) 
  (* C_ADDRB_WIDTH = "2" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.386699 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "V.mem" *) 
  (* C_INIT_FILE_NAME = "V.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4" *) 
  (* C_READ_DEPTH_B = "4" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4" *) 
  (* C_WRITE_DEPTH_B = "4" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[1:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[1:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19312)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
