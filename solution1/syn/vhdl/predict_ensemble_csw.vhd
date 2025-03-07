-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_csw_rom is 
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


architecture rtl of predict_ensemble_csw_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "1010", 2 => "0101", 3 => "1010", 4 to 6=> "0000", 7 => "1010", 
    8 => "0000", 9 to 10=> "1000", 11 => "1011", 12 to 15=> "0000", 16 => "0011", 
    17 => "0000", 18 => "1010", 19 => "1011", 20 to 21=> "0000", 22 => "0010", 
    23 => "1101", 24 => "0010", 25 => "1001", 26 => "0001", 27 => "1010", 
    28 => "0101", 29 => "0010", 30 to 34=> "0000", 35 => "1011", 36 to 38=> "0000", 
    39 => "0011", 40 => "0100", 41 => "0000", 42 => "0011", 43 => "1011", 
    44 => "0110", 45 => "0000", 46 => "1010", 47 => "0101", 48 to 49=> "0000", 
    50 => "1011", 51 => "0000", 52 => "0011", 53 to 54=> "0000", 55 => "1101", 
    56 to 57=> "0000", 58 => "0001", 59 => "0101", 60 to 62=> "0000", 63 => "1011", 
    64 to 65=> "0000", 66 => "1010", 67 => "1011", 68 => "0000", 69 => "1100", 
    70 => "0110", 71 => "1100", 72 => "0011", 73 => "1100", 74 to 75=> "0000", 
    76 => "1100", 77 to 78=> "0000", 79 => "1100", 80 => "0000", 81 => "1011", 
    82 => "0000", 83 => "0101", 84 => "1100", 85 => "0001", 86 => "0101", 
    87 => "0000", 88 => "1000", 89 => "0000", 90 => "1010", 91 to 92=> "0000", 
    93 to 94=> "1011", 95 => "0111", 96 => "0000", 97 => "0100", 98 to 102=> "0000", 
    103 => "0011", 104 => "0000", 105 => "0100", 106 => "1001", 107 to 108=> "0001", 
    109 => "0000", 110 => "1011", 111 to 116=> "0000", 117 => "1000", 118 => "1011", 
    119 => "0000", 120 => "0010", 121 => "0000", 122 => "0101", 123 => "1101", 
    124 => "0000", 125 => "0101", 126 => "0001", 127 => "0000", 128 => "1000", 
    129 => "1011", 130 => "0001", 131 to 132=> "0000", 133 => "0011", 134 => "0000", 
    135 => "1100", 136 to 139=> "0000", 140 => "0101", 141 => "1010", 142 => "0000", 
    143 => "0110", 144 => "0010", 145 => "0110", 146 => "0000", 147 => "1011", 
    148 => "0000", 149 => "0100", 150 to 151=> "0000", 152 => "0001", 153 to 157=> "0000", 
    158 => "0001", 159 => "1100", 160 => "0100", 161 => "0010", 162 => "0000", 
    163 => "1101", 164 => "1010", 165 => "1011", 166 => "1101", 167 to 168=> "0000", 
    169 => "0110", 170 => "1101", 171 to 174=> "0000", 175 to 176=> "1000", 177 => "0111", 
    178 to 180=> "0000", 181 => "0101", 182 to 183=> "0000", 184 => "0110", 185 => "0000", 
    186 => "1001", 187 to 194=> "0000" );

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

entity predict_ensemble_csw is
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

architecture arch of predict_ensemble_csw is
    component predict_ensemble_csw_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_csw_rom_U :  component predict_ensemble_csw_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


