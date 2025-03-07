-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eMU_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_eMU_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 => "1", 5 => "0", 6 => "1", 7 => "0", 8 => "1", 9 => "0", 
    10 to 11=> "1", 12 to 15=> "0", 16 to 21=> "1", 22 to 23=> "0", 24 to 25=> "1", 26 to 27=> "0", 28 to 29=> "1", 
    30 to 32=> "0", 33 => "1", 34 to 37=> "0", 38 => "1", 39 => "0", 40 => "1", 41 => "0", 
    42 to 44=> "1", 45 to 46=> "0", 47 to 48=> "1", 49 to 51=> "0", 52 => "1", 53 => "0", 54 to 57=> "1", 
    58 => "0", 59 => "1", 60 to 62=> "0", 63 => "1", 64 to 65=> "0", 66 to 67=> "1", 68 => "0", 
    69 => "1", 70 to 72=> "0", 73 to 75=> "1", 76 => "0", 77 to 80=> "1", 81 => "0", 82 to 83=> "1", 
    84 to 86=> "0", 87 => "1", 88 => "0", 89 => "1", 90 to 91=> "0", 92 to 94=> "1", 95 to 96=> "0", 
    97 => "1", 98 => "0", 99 => "1", 100 to 101=> "0", 102 => "1", 103 to 104=> "0", 105 to 109=> "1", 
    110 => "0", 111 => "1", 112 to 114=> "0", 115 to 116=> "1", 117 => "0", 118 => "1", 119 => "0", 
    120 => "1", 121 to 122=> "0", 123 => "1", 124 to 126=> "0", 127 to 128=> "1", 129 to 132=> "0", 133 to 135=> "1", 
    136 to 139=> "0", 140 to 146=> "1", 147 => "0", 148 => "1", 149 => "0", 150 => "1", 151 to 152=> "0", 
    153 => "1", 154 to 155=> "0", 156 to 157=> "1", 158 to 159=> "0", 160 to 161=> "1", 162 => "0", 163 to 166=> "1", 
    167 to 194=> "0" );

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

entity predict_ensemble_eMU is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_eMU is
    component predict_ensemble_eMU_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eMU_rom_U :  component predict_ensemble_eMU_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


