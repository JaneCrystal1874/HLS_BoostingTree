-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bTr_rom is 
    generic(
             DWIDTH     : integer := 4; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_bTr_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0110", 1 => "1000", 2 => "1001", 3 => "1011", 4 to 5=> "0000", 
    6 => "1011", 7 => "0000", 8 => "1000", 9 => "0000", 10 => "1000", 
    11 => "0000", 12 => "0111", 13 => "1001", 14 to 17=> "0000", 18 to 19=> "1010", 
    20 => "0000", 21 => "0101", 22 => "0000", 23 => "1011", 24 to 25=> "0000", 
    26 => "1000", 27 => "0000", 28 => "1001", 29 => "0000", 30 => "1000", 
    31 => "1011", 32 => "0011", 33 => "1001", 34 => "1010", 35 to 36=> "1001", 
    37 => "0000", 38 => "0011", 39 => "0101", 40 to 43=> "0000", 44 => "1000", 
    45 to 46=> "0000", 47 => "0011", 48 to 50=> "0000", 51 to 52=> "0110", 53 => "0011", 
    54 => "0000", 55 => "0011", 56 => "0000", 57 => "1001", 58 => "0000", 
    59 => "0011", 60 => "1011", 61 => "1000", 62 => "0101", 63 to 64=> "0000", 
    65 => "0101", 66 => "0000", 67 => "0011", 68 => "0000", 69 => "1001", 
    70 to 71=> "0000", 72 => "1101", 73 to 74=> "0000", 75 => "0101", 76 => "0000", 
    77 => "0110", 78 => "0000", 79 => "0111", 80 => "0000", 81 => "0011", 
    82 => "0111", 83 => "1011", 84 => "0011", 85 to 87=> "0000", 88 => "1010", 
    89 to 91=> "0000", 92 => "0011", 93 => "1010", 94 to 95=> "0000", 96 to 97=> "1010", 
    98 to 100=> "0000", 101 => "0101", 102 => "1001", 103 to 104=> "0000", 105 => "0111", 
    106 => "0101", 107 => "1100", 108 => "1011", 109 => "1001", 110 => "1100", 
    111 => "0001", 112 => "1011", 113 to 114=> "0000", 115 => "1010", 116 => "0000", 
    117 => "1011", 118 => "0000", 119 => "0101", 120 => "0000", 121 to 122=> "1011", 
    123 to 126=> "0000", 127 => "0100", 128 to 129=> "0000", 130 => "1010", 131 => "0000", 
    132 => "0001", 133 to 136=> "0000", 137 => "0001", 138 => "0000", 139 => "1010", 
    140 => "0000", 141 => "1010", 142 => "0000", 143 => "0111", 144 => "0000", 
    145 => "0011", 146 => "0111", 147 to 149=> "0000", 150 => "0011", 151 => "0001", 
    152 => "1001", 153 => "1000", 154 => "0000", 155 to 156=> "0001", 157 => "1100", 
    158 to 159=> "0000", 160 => "0101", 161 => "0000", 162 => "0011", 163 to 164=> "0000", 
    165 => "1001", 166 => "1000", 167 => "0000", 168 => "0010", 169 to 170=> "1010", 
    171 to 172=> "0000", 173 => "0110", 174 => "1000", 175 => "1010", 176 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_bTr is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bTr is
    component predict_ensemble_bTr_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bTr_rom_U :  component predict_ensemble_bTr_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


